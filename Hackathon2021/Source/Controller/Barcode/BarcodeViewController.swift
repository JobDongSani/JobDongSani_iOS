//
//  BarcodeViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit
import AVFoundation
import Alamofire

class BarcodeViewController: BaseVc{
    
    private let captureSession = AVCaptureSession()
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var qrCodeFrameView: UIView?
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                                      AVMetadataObject.ObjectType.code39,
                                      AVMetadataObject.ObjectType.code39Mod43,
                                      AVMetadataObject.ObjectType.code93,
                                      AVMetadataObject.ObjectType.code128,
                                      AVMetadataObject.ObjectType.ean8,
                                      AVMetadataObject.ObjectType.ean13,
                                      AVMetadataObject.ObjectType.aztec,
                                      AVMetadataObject.ObjectType.pdf417,
                                      AVMetadataObject.ObjectType.itf14,
                                      AVMetadataObject.ObjectType.dataMatrix,
                                      AVMetadataObject.ObjectType.interleaved2of5,
                                      AVMetadataObject.ObjectType.qr]
    
    private let bgView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius =  40
    }
    private let backBtn = UIButton().then{
        $0.setImage(UIImage(named: "JobDongSani_BackButton")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    private let messageLabel = UILabel().then{
        $0.textColor = .white
        $0.backgroundColor = .lightGray.withAlphaComponent(0.6)
        $0.dynamicFont(fontSize: 14, fontName: "AppleSDGothicNeo-Light")
        $0.text = "바코드를 입력해주세요"
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
    }
    private let titleLabel = UILabel().then{
        $0.text = "정보"
        $0.dynamicFont(fontSize: 20, fontName: "AppleSDGothicNeo-Bold")
    }
    private let noInfomation = UILabel().then{
        $0.text = "정보가 없습니다."
        $0.textColor = .black
        $0.dynamicFont(fontSize: 12, fontName: "AppleSDGothicNeo-Bold")
    }
    private let itemName = UILabel().then{
        $0.text = "정보가 없습니다."
        $0.isHidden = true
        $0.textColor = .black
        $0.dynamicFont(fontSize: 12, fontName: "AppleSDGothicNeo-Regular")
    }
    private let itemType = UILabel().then{
        $0.text = "정보가 없습니다."
        $0.textColor = .black
        $0.isHidden = true
        $0.dynamicFont(fontSize: 12, fontName: "AppleSDGothicNeo-Regular")
    }
    private let recycleInformationLabel = UILabel().then{
        $0.text = "정보가 없습니다."
        $0.isHidden = true
        $0.numberOfLines = 6
        $0.textColor = .black
        $0.dynamicFont(fontSize: 12, fontName: "AppleSDGothicNeo-Regular")
    }
    
    @objc private func backButton(){
        navigationController?.popViewController(animated: true)
    }
    override func configure() {
        super.configure()
        addView()
        location()
        videoSetting()
    }
    private func addView(){
        [bgView,backBtn,messageLabel].forEach{ view.addSubview($0)}
        [titleLabel,noInfomation,itemName,itemType,recycleInformationLabel].forEach{ bgView.addSubview($0)}
    }
    private func location(){
        backBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(bounds.height/14)
            $0.left.equalToSuperview().offset(bounds.width/18.75)
            $0.height.width.equalTo(20)
        }
        bgView.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(68)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(bounds.height/2.38)
        }
        messageLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(82)
            $0.height.equalTo(bounds.height/20.3)
            $0.top.equalToSuperview().offset(bounds.height/4.58)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(bgView).offset(46)
            $0.left.equalToSuperview().offset(29)
        }
        noInfomation.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        itemName.snp.makeConstraints{
            $0.left.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        itemType.snp.makeConstraints{
            $0.left.equalTo(titleLabel)
            $0.top.equalTo(itemName.snp.bottom).offset(20)
        }
        recycleInformationLabel.snp.makeConstraints{
            $0.left.equalTo(titleLabel)
            $0.top.equalTo(itemType.snp.bottom).offset(20)
        }
    }
    
    private func videoSetting(){
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Failed to get the camera device")
            return}
        do{
            let input = try? AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input!)
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 600)
            
            view.layer.addSublayer(videoPreviewLayer!)
            
            //Start
            captureSession.startRunning()
            
            view.bringSubviewToFront(bgView)
            view.bringSubviewToFront(backBtn)
            view.bringSubviewToFront(messageLabel)
            
            if let qrcodeFrameView = qrCodeFrameView{
                qrcodeFrameView.layer.borderColor = UIColor.yellow.cgColor
                qrcodeFrameView.layer.borderWidth = 2
                view.addSubview(qrcodeFrameView)
                view.bringSubviewToFront(qrcodeFrameView)
            }
        }
        catch {
            print(error)
            return
        }
    }
    
}
extension BarcodeViewController : AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        //MetadataObject가 없으면
        if metadataObjects.count == 0{
            qrCodeFrameView?.frame = CGRect.zero
            
            return
        }
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if supportedCodeTypes.contains(metadataObj.type){
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            //데이터 받음
            if metadataObj.stringValue != nil{
                httpsSearch(String: metadataObj.stringValue!)
                messageLabel.text = "검색완료"
                noInfomation.isHidden = true
                [itemName,itemType,recycleInformationLabel].forEach{ $0.isHidden = false}
                print(metadataObj.stringValue ?? "")
                captureSession.stopRunning()
            }
        }
    }
    func httpsSearch(String : String){
        let param : Parameters = ["query" : String]
        let header : HTTPHeaders = ["X-Naver-Client-Id" : "DsBcMLHWPNapi7KAHO6C", "X-Naver-Client-Secret" : "yXi3ehMCIB"]
        
        let af  = AF.request("https://openapi.naver.com/v1/search/shop.json", method: .get, parameters: param, encoding: URLEncoding.default, headers:header)
        af.responseData{ response in
            switch response.result{
            case .success(let success) :
                print("성공 \(success)")
                self.isBVaildData(success)
            case.failure(let error):
                print(error)
            }
        }
    }
    func isBVaildData(_ data : Data){
        let decoder = JSONDecoder()
        guard let dataDecoder = try? decoder.decode(barCodeSearch.self, from: data) else {return}
        print(dataDecoder.items)
        itemName.text = dataDecoder.items[0].title
    }
    
}

class barCodeSearch: Codable{
    let items : [itemsDocument]
}
struct itemsDocument: Codable{
    let title : String
}
