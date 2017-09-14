import UIKit

open class ImageProcess: NSObject {
    // MARK:- convert the CGImageToCIImage
    /// convertCGImageToCIImage
    ///
    /// - Parameter cgImage: input cgImage
    /// - Returns: output CIImage
    static open func convertCGImageToCIImage(_ cgImage:CGImage) -> CIImage{
        return CIImage.init(cgImage: cgImage)
    }
    
    // MARK:- convert the CIImageToCGImage
    /// convertCIImageToCGImage
    ///
    /// - Parameter ciImage: input ciImage
    /// - Returns: output CGImage
    static open func convertCIImageToCGImage(_ ciImage:CIImage) -> CGImage{
        let ciContext = CIContext.init()
        let cgImage:CGImage = ciContext.createCGImage(ciImage, from: ciImage.extent)!
        return cgImage
    }
    
    static open func convertCIImageToUIImage(_ ciImage:CIImage) -> UIImage {
        let uiImage = UIImage.init(ciImage: ciImage)
        return uiImage
    }
    
    static open func convertUIImageToCIImage(_ uiImage:UIImage) -> CIImage {
        
        var ciImage = uiImage.ciImage
        if ciImage == nil {
            let cgImage = uiImage.cgImage
            ciImage = self.convertCGImageToCIImage(cgImage!)
        }
        return ciImage!
    }
    
    /// UIImage转为CGImageG
    /// UIImage转CGImage有时候不能直接采用uiImage.cgImage获取
    /// 当uiImage.cgImage为nil的时候需要先通过uiImage.ciImage得到
    /// ciImage, 然后通过convertCIImageToCGImage将ciImage装换为cgImage
    static open func convertUIImageToCGImage(_ uiImage:UIImage) -> CGImage {
        var cgImage = uiImage.cgImage
        
        if cgImage == nil {
            let ciImage = uiImage.ciImage
            cgImage = self.convertCIImageToCGImage(ciImage!)
        }
        return cgImage!
    }
    
    static open func convertUIImageToData(_ uiImage:UIImage) -> Data {
        var data = UIImagePNGRepresentation(uiImage)
        
        if data == nil {
            let cgImage = self.convertUIImageToCGImage(uiImage)
            let uiImage_ = UIImage.init(cgImage: cgImage)
            data = UIImagePNGRepresentation(uiImage_)
        }
        return data!
    }

}
