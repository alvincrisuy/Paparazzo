import UIKit
import AVFoundation

enum MediaPickerViewMode {
    case Camera
    case PhotoPreview(MediaPickerItem)
}

protocol MediaPickerViewInput: class {
    
    func setMode(mode: MediaPickerViewMode)
    func adjustForDeviceOrientation(orientation: DeviceOrientation)
    
    func setCaptureSession(session: AVCaptureSession)
    
    func setContinueButtonTitle(title: String)

    func setLatestLibraryPhoto(image: ImageSource?)
    
    func setFlashButtonVisible(visible: Bool)
    func setFlashButtonOn(isOn: Bool)
    func animateFlash()
    
    func addItems(item: [MediaPickerItem])
    func removeItem(item: MediaPickerItem)
    func selectItem(item: MediaPickerItem)
    
    func setShutterButtonEnabled(enabled: Bool)

    // TODO: это по ходу не нужно будет
    func startSpinnerForNewPhoto()
    func stopSpinnerForNewPhoto()
    
    var onCloseButtonTap: (() -> ())? { get set }
    var onContinueButtonTap: (() -> ())? { get set }
    
    var onCameraToggleButtonTap: (() -> ())? { get set }
    func setCameraToggleButtonVisible(visible: Bool)
    
    var onCameraVisibilityChange: ((isCameraVisible: Bool) -> ())? { get set }
    
    // MARK: - Actions in photo ribbon
    var onItemSelect: (MediaPickerItem -> ())? { get set }
    
    // MARK: - Camera actions
    var onPhotoLibraryButtonTap: (() -> ())? { get set }
    var onShutterButtonTap: (() -> ())? { get set }
    var onFlashToggle: (Bool -> ())? { get set }
    
    // MARK: - Selected photo actions
    var onRemoveButtonTap: (() -> ())? { get set }
    var onCropButtonTap: (() -> ())? { get set }
    var onReturnToCameraTap: (() -> ())? { get set }
}