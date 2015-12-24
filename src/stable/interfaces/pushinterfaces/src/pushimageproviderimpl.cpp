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

#include "jderobot/interfaces/pushimageproviderimpl.h"

using namespace jderobot::interfaces;


PushImageProviderI::PushImageProviderI ()
{}

PushImageProviderI::~PushImageProviderI ()
{}

void
PushImageProviderI::pushInitialFrame(const unsigned char *img_data, std::string format, int width, int height, int channels, size_t pixel_size){
    IceUtil::Mutex::Lock lock_guard(mutex);
    imageData.description.format = format;
    imageData.description.height = height;
    imageData.description.width  = width;
    imageData.description.size = width*height*channels*pixel_size;

    imageData.pixelData.resize(imageData.description.size);
    memcpy(imageData.pixelData.data(), img_data, imageData.pixelData.size());

    imageFormats.clear();
    imageFormats.push_back(imageData.description.format);
}

void
PushImageProviderI::pushNextFrame(const unsigned char* image_data){
    IceUtil::Mutex::Lock lock_guard(mutex);
    memcpy(imageData.pixelData.data(), image_data, imageData.pixelData.size());
}
