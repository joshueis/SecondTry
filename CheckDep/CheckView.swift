//
//  CheckView.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/21/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import UIKit
import AVFoundation

class CheckView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCapturePhotoOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    func didPressTakePhoto(){
        if let videoConnection = stillImageOutput?.connection(withMediaType: AVMediaTypeVideo){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            stillImageOutput?.capturePhoto(with: <#T##AVCapturePhotoSettings#>, delegate: <#T##AVCapturePhotoCaptureDelegate#>)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //previewLayer?.frame = cameraView.bounds // frame
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        captureSession = AVCaptureSession()
//        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
//        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
//        var input: AVCaptureDeviceInput?
//        do{
//            try input = AVCaptureDeviceInput(device: backCamera)
//            if (captureSession?.canAddInput(input))!{
//                captureSession?.addInput(input)
//                stillImageOutput = AVCapturePhotoOutput()
//                //stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
//                
//                if (captureSession?.canAddOutput(stillImageOutput))!{
//                    captureSession?.addOutput(stillImageOutput)
//                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//                    previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
//                    previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
//                    cameraView.layer.addSublayer(previewLayer!)
//                    captureSession?.startRunning()
//                }
//                
//            }
//        }
//        catch{
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nserror = error as NSError
//            fatalError("Checkview unresolved error \(nserror), \(nserror.userInfo)")
//        }
//        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
