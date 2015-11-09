#include "interfaces/pose3di.h"


using namespace gazebo;


Pose3DI::Pose3DI (ImuPlugin* imu_p) : pose3DData ( new jderobot::Pose3DData() ) {
    this->imu_p = imu_p;
}

jderobot::Pose3DDataPtr
Pose3DI::getPose3DData ( const Ice::Current& ) {
    pthread_mutex_lock(&imu_p->mutex_imuplugin);

    pose3DData->x = imu_p->imuplugin.pose.pos.x;
    pose3DData->y = imu_p->imuplugin.pose.pos.y;
    pose3DData->z = imu_p->imuplugin.pose.pos.z;
    pose3DData->h = 0;
    pose3DData->q0 = imu_p->imuplugin.orien.w;
    pose3DData->q1 = imu_p->imuplugin.orien.x;
    pose3DData->q2 = imu_p->imuplugin.orien.y;
    pose3DData->q3 = imu_p->imuplugin.orien.z;

    pthread_mutex_unlock(&imu_p->mutex_imuplugin);

    return pose3DData;
}

Ice::Int
Pose3DI::setPose3DData ( const jderobot::Pose3DDataPtr & data, const Ice::Current& ) {
    pthread_mutex_lock(&imu_p->mutex_imuplugin);

    imu_p->imuplugin.pose.pos.x = data->x;
    imu_p->imuplugin.pose.pos.y = data->y;
    imu_p->imuplugin.pose.pos.z = data->z;
    imu_p->imuplugin.orien.w = data->q0;
    imu_p->imuplugin.orien.x = data->q1;
    imu_p->imuplugin.orien.y = data->q2;
    imu_p->imuplugin.orien.z = data->q3;

    pthread_mutex_unlock(&imu_p->mutex_imuplugin);
}


