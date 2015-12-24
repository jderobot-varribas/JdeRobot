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

#include <jderobot/interfaces/imageproviderimpl.h>

using namespace jderobot::interfaces;


ImageProviderI::ImageProviderI()
{
    imageData.description.size = -1;
}

ImageProviderI::~ImageProviderI(){
}


ImageDescription
ImageProviderI::getImageDescription(const Ice::Current&){
    IceUtil::Mutex::Lock lock_guard(mutex);
    if (imageData.description.size == -1)
        throw jderobot::DataNotExistException("not initialized");

    return imageData.description;
}


ImageFormats
ImageProviderI::getAvailableImageFormats(const Ice::Current&) {
    IceUtil::Mutex::Lock lock_guard(mutex);
    if (imageFormats.empty())
        throw jderobot::DataNotExistException("not initialized");

    return imageFormats;
}


void
ImageProviderI::getImageData_async (const jderobot::interfaces::AMD_ImageProvider_getImageDataPtr& cb,const std::string& format, const Ice::Current& c){
    IceUtil::Mutex::Lock lock_guard(mutex);
    if (std::find(imageFormats.begin(), imageFormats.end(), format) == imageFormats.end())
        throw JderobotException("format not supported");

    _getImageData_async(cb, format, c);
}

void
ImageProviderI::_getImageData_async (const jderobot::interfaces::AMD_ImageProvider_getImageDataPtr& cb,const std::string& /*format*/, const Ice::Current& /*c*/){
    //Non async response
    if (imageData.pixelData.size() == 0)
        throw DataNotExistException("pixelData is empty");

    cb->ice_response(imageData);
}

