//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `HiraganaAPIStub.json`.
    static let hiraganaAPIStubJson = Rswift.FileResource(bundle: R.hostingBundle, name: "HiraganaAPIStub", pathExtension: "json")
    
    /// `bundle.url(forResource: "HiraganaAPIStub", withExtension: "json")`
    static func hiraganaAPIStubJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.hiraganaAPIStubJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `background_img`.
    static let background_img = Rswift.ImageResource(bundle: R.hostingBundle, name: "background_img")
    
    /// `UIImage(named: "background_img", bundle: ..., traitCollection: ...)`
    static func background_img(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.background_img, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `InputViewController`, and contains static references to 1 segues.
    struct inputViewController {
      /// Segue identifier `toOutput`.
      static let toOutput: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, InputViewController, OutputViewController> = Rswift.StoryboardSegueIdentifier(identifier: "toOutput")
      
      /// Optionally returns a typed version of segue `toOutput`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toOutput(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, InputViewController, OutputViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.inputViewController.toOutput, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `InputStoryboard`.
    static let inputStoryboard = _R.storyboard.inputStoryboard()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `OutputStoryboard`.
    static let outputStoryboard = _R.storyboard.outputStoryboard()
    
    /// `UIStoryboard(name: "InputStoryboard", bundle: ...)`
    static func inputStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.inputStoryboard)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "OutputStoryboard", bundle: ...)`
    static func outputStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.outputStoryboard)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try inputStoryboard.validate()
      try launchScreen.validate()
      try outputStoryboard.validate()
    }
    
    struct inputStoryboard: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "InputStoryboard"
      
      static func validate() throws {
        if UIKit.UIImage(named: "background_img", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'background_img' is used in storyboard 'InputStoryboard', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct outputStoryboard: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = OutputViewController
      
      let bundle = R.hostingBundle
      let name = "OutputStoryboard"
      
      static func validate() throws {
        if UIKit.UIImage(named: "background_img", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'background_img' is used in storyboard 'OutputStoryboard', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
