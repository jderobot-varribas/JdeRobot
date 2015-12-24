/*
 *  Copyright (C) 2015 JDE Developers Team
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see http://www.gnu.org/licenses/.
 *  Authors :
 *       Victor Arribas Raigadas <v.arribas.urjc@gmai.com>
 */

#ifndef CAMERA_BASEIMPL_H
#define CAMERA_BASEIMPL_H

#include <list>
#include <iostream>

#include <boost/shared_ptr.hpp>

#include <jderobot/interfaces/camera.h>
#include <jderobot/interfaces/imageproviderimpl.h>


namespace jderobot{
namespace interfaces{

typedef boost::shared_ptr<CameraDescription> CameraDescriptionPtr;

class CameraBaseI:
        virtual public jderobot::interfaces::Camera,
        virtual public jderobot::interfaces::ImageProviderI
{
public:
    CameraBaseI();
    virtual ~CameraBaseI();

    jderobot::interfaces::CameraDescription getCameraDescription(
            const Ice::Current& = ::Ice::Current());

    virtual Ice::Int setCameraDescription(
            const jderobot::interfaces::CameraDescription&,
            const Ice::Current& = ::Ice::Current())
        { throw jderobot::JderobotException("Not implemented"); }

protected:
    /// Data
    CameraDescriptionPtr cameraDescriptionPtr;
};


}}//NS

#endif // CAMERA_BASEIMPL_H

