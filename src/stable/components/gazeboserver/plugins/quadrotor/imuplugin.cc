#include "imuplugin.h"

namespace gazebo {

GZ_REGISTER_SENSOR_PLUGIN(ImuPlugin);

ImuPlugin::ImuPlugin() {
    pthread_mutex_init(&mutex_imuplugin, NULL);
	std::cout << "Constructor ImuPlugin\n";
}

ImuPlugin::~ImuPlugin() {}

void ImuPlugin::PoseCallback(const boost::shared_ptr<const msgs::Pose> &_msg) {
    pthread_mutex_lock(&this->mutex_imuplugin);
    pose = msgs::Convert(*_msg);
    pthread_mutex_unlock(&this->mutex_imuplugin);
}

void ImuPlugin::Load(sensors::SensorPtr _sensor, sdf::ElementPtr _sdf) {
    this->parentSensor =
        boost::dynamic_pointer_cast<sensors::ImuSensor>(_sensor);

    if (!parentSensor)
        gzerr << "No ImuSensor detected.\n";

    this->parentSensor->SetActive(true);
    if(!_sdf->HasElement("cfgFile"))
        this->cfgfile_imuplugin = "--Ice.Config=imuplugin.cfg";
    else
        this->cfgfile_imuplugin = "--Ice.Config=" + _sdf->GetElement("cfgFile")->GetValue()->GetAsString();
    if(!_sdf->HasElement("poseTopic"))
        this->pose_topic_ = "~/pose_topic";
    else
        this->pose_topic_ = _sdf->GetElement("poseTopic")->GetValue()->GetAsString();
    transport::NodePtr node(new transport::Node());
    node->Init();
    sub_ = node->Subscribe(this->pose_topic_, &ImuPlugin::PoseCallback, this);

    pthread_t thr_ice;
    pthread_create(&thr_ice, NULL, &thread_Pose3DICE, (void*) this);
    this->updateConnection = this->parentSensor->ConnectUpdated(
        boost::bind(&ImuPlugin::OnUpdate, this));
}

void ImuPlugin::Init() {
    /*parentSensor->SetReferencePose();
    pthread_mutex_lock(&this->mutex_imuplugin);
    this->imuplugin.pose.Set(0, 0, 0, 0, 0, 0);
    this->imuplugin.orien.SetFromEuler(0, 0, 0);
    pthread_mutex_unlock(&this->mutex_imuplugin);*/
}

void ImuPlugin::OnUpdate() {
    pthread_mutex_lock(&this->mutex_imuplugin);
    math::Quaternion aux(this->parentSensor->GetOrientation().GetRoll(),
                         this->parentSensor->GetOrientation().GetPitch(),
                         pose.rot.GetYaw());
    imuplugin.pose.pos = pose.pos;
    imuplugin.orien = aux;
    pthread_mutex_unlock(&this->mutex_imuplugin);
}



void* thread_Pose3DICE ( void* v )
{
    ImuPlugin* imuplugin = (ImuPlugin*)v;
    char* name = (char*) imuplugin->cfgfile_imuplugin.c_str();
    Ice::CommunicatorPtr ic;
    int argc = 1;
    Ice::PropertiesPtr prop;
    char* argv[] = {name};

    try {
        ic = Ice::initialize(argc, argv);

        prop = ic->getProperties();
        std::string imu_name = prop->getProperty("ImuPlugin.Name");
        std::string endpoints = prop->getProperty("ImuPlugin.Endpoints");
        std::cout << "ImuPlugin Endpoints > " << endpoints << std::endl;

        Ice::ObjectAdapterPtr Adapter =
                ic->createObjectAdapterWithEndpoints("AdapterImuPlugin", endpoints);

        Ice::ObjectPtr pose3d = new Pose3DI(imuplugin);
        Adapter->add(pose3d, ic->stringToIdentity(imu_name));
        
        Adapter->activate();

        ic->waitForShutdown();
    } catch (const Ice::Exception& e) {
        std::cerr << e << std::endl;
    } catch (const char* msg) {
        std::cerr << msg << std::endl;
    }
    if (ic) {
        try {
            ic->destroy();
        } catch (const Ice::Exception& e) {
            std::cerr << e << std::endl;
        }
    }
}

} //gazebo
