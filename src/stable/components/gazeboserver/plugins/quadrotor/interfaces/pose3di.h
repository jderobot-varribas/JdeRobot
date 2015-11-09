#ifndef POSE3DI_H
#define POSE3DI_H


#include <pose3d.h>
#include <imuplugin.h>


class Pose3DI : virtual public jderobot::Pose3D {
public:
    Pose3DI (gazebo::ImuPlugin* imu_p);
    virtual ~Pose3DI () {}

    virtual jderobot::Pose3DDataPtr getPose3DData ( const Ice::Current& );
    virtual Ice::Int setPose3DData ( const jderobot::Pose3DDataPtr & data,
                                     const Ice::Current& );

public:
    gazebo::ImuPlugin* imu_p;

private:
    jderobot::Pose3DDataPtr pose3DData;
};




#endif // POSE3DI_H
