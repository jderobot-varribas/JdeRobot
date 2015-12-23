/*
 *
 *  Copyright (C) 1997-2015 JDE Developers Team
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
 *
 *  Authors:
 *      David Lobato Bravo <dav.lobato@gmail.com> (1997-2010)
 *      Victor Arribas <v.arribas.urjc@gmail.com> (2015)
 *
 */


#ifndef CAMERA_ICE
#define CAMERA_ICE


#include <jderobot/interfaces/image.ice>

module jderobot{
module interfaces{
  /// Camera ///

  /**
   * Static description of a camera
   */
  struct CameraOpticParams
  {
    float fdistx;
    float fdisty;
    float u0;
    float v0;
    float skew;
  };
  struct CameraPose{
    float foax;
    float foay;
    float foaz;
    float posx;
    float posy;
    float posz;
    float roll;
  };
  struct CameraDescription{
    CameraOpticParams optics;
    CameraPose pose;
  };
    
  /**
   * Camera interface
   */
  interface Camera extends ImageProvider
  {
    idempotent CameraDescription getCameraDescription();
    int setCameraDescription(CameraDescription description);
  };

/// StreamableCamera ///
  struct StreamableCameraDescription{
    string name;
    string shortDescription;
    string streamingUri;
  };

  interface StreamableCamera extends Camera
  {
    idempotent StreamableCameraDescription getStreamingDescription();

    string startCameraStreaming(optional(1) string streamingUri);
    void stopCameraStreaming();
    void resetStreaming();
  };

}; // module interfaces
}; // module jderobot

#endif /*CAMERA_ICE*/
