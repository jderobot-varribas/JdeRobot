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

#ifndef IMAGEPROVIDER_IMPL_H
#define IMAGEPROVIDER_IMPL_H

#include <list>
#include <iostream>
#include <IceUtil/Mutex.h>

#include <jderobot/interfaces/image.h>


namespace jderobot{
namespace interfaces{


class ImageProviderI: virtual public jderobot::interfaces::ImageProvider {
public:
    ImageProviderI();
    virtual ~ImageProviderI();

    /// jderobot::ImageProvider
    jderobot::interfaces::ImageFormats
    getAvailableImageFormats(
            const Ice::Current& c);

    jderobot::interfaces::ImageDescription
    getImageDescription(
            const Ice::Current& c);

    void
    getImageData_async (
            const jderobot::interfaces::AMD_ImageProvider_getImageDataPtr& cb,
            const std::string& format,
            const Ice::Current& c);

protected:
    /**
     * function to be override for custom Image dispatch.
     */
    virtual void _getImageData_async (
            const jderobot::interfaces::AMD_ImageProvider_getImageDataPtr& cb,
            const std::string& format,
            const Ice::Current& c);

protected:
    /// Data
    /// Use it by your own risk (mutex required)
    jderobot::interfaces::ImageData imageData;
    jderobot::interfaces::ImageFormats imageFormats;
    jderobot::interfaces::ImageDescription imageDescription;

    /// Ice
    IceUtil::Mutex mutex;
};


}}//NS

#endif // IMAGEPROVIDER_IMPL_H

