#include "poseplugin.hh"

namespace gazebo {

GZ_REGISTER_MODEL_PLUGIN(PosePlugin)

PosePlugin::PosePlugin() {
    std::cout << "Constructor PosePlugin\r\n";
}

PosePlugin::~PosePlugin() {}

void PosePlugin::Load(physics::ModelPtr _model, sdf::ElementPtr _sdf) {
    this->model = _model;
    this->sdf = _sdf;
    this->world = _model->GetWorld();
    std::cout<<"PosePlugin::Load()\n\tModelPtr name: "<<_model->GetName()<<"\n\tModelPtr Id: "<<_model->GetId()<<std::endl;
    std::cout<<"\tWorld name: "<<world->GetName()<<std::endl;
    std::cout<<" model: "<<model->GetByName(model->GetName())<<std::endl;
    std::cout<<" world: "<<world->GetByName(model->GetName())<<std::endl;
    std::cout<<"\t PosePlugin type: "<<this->GetType()<<std::endl;
    std::cout<<"\t handle: "<<this->GetHandle()<<std::endl;

    std::cout<<"PosePlugin::Load() Gathering all sensors: "<<std::endl;
    std::string sensors[]={"cam_sensor_ventral","cam_sensor_frontal","sonar","imu_sensor"",pose_plugin","base_link"};
    int N=sizeof(sensors)/sizeof(std::string);
    for (int i=0;i<N;i++){
        std::cout<<"\t"<<sensors[i]<<": "<<model->GetByName(sensors[i])<<std::endl;
    }

    if(!_sdf->HasElement("poseTopic"))
        this->pose_topic_ = "~/pose_topic";
    else
        this->pose_topic_ = _sdf->GetElement("poseTopic")->GetValue()->GetAsString();

    transport::NodePtr node(new transport::Node());
    node->Init();
    pub_ = node->Advertise<msgs::Pose>(pose_topic_);

    this->updateConnection = event::Events::ConnectWorldUpdateBegin(
          boost::bind(&PosePlugin::OnUpdate, this));
}

void PosePlugin::Init() {
    //pub_->WaitForConnection();
}

void PosePlugin::OnUpdate() {
    math::Pose pose = model->GetWorldPose();
    msgs::Pose msg;
    msgs::Set(&msg, pose);
    pub_->Publish(msg);
}

} // gazebo
