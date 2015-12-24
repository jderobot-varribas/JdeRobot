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

#ifndef PUSHCAMERA_IMPL_H
#define PUSHCAMERA_IMPL_H

#include <jderobot/interfaces/camerabaseimpl.h>
#include <jderobot/interfaces/pushimageproviderimpl.h>


namespace jderobot{
namespace interfaces{


class PushCameraI:
        virtual public jderobot::interfaces::CameraBaseI,
        virtual public jderobot::interfaces::PushImageProviderI
{
public:
    PushCameraI ();
    virtual ~PushCameraI ();

    void pushInitialFrame(const jderobot::interfaces::CameraDescription description, const unsigned char* image, std::string format, int width, int height, int channels, size_t pixel_size=1);

};


}}//NS

#endif // PUSHCAMERA_IMPL_H

