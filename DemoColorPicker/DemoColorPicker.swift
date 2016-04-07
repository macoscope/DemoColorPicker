//
//  DemoColorPicker.swift
//  DemoColorPicker
//
//  Created by Maciek Grzybowski on 07/04/16.
//  Copyright © 2016 Macoscope. All rights reserved.
//

import Foundation
import AppKit


public class DemoColorPicker: NSColorPicker, NSColorPickingCustom {
    
    private let bundle = NSBundle(identifier: "com.macoscope.DemoColorPicker")!
    
    @IBOutlet weak var pickerView: NSView!
    @IBOutlet weak var selectedColorRenderingView: NSView!
    @IBOutlet weak var selectedColorValueLabel: NSTextField!

    public func supportsMode(mode: NSColorPanelMode) -> Bool {
        return true
    }
    
    public func currentMode() -> NSColorPanelMode {
        return .NSNoModeColorPanel
    }
    
    public func provideNewView(initialRequest: Bool) -> NSView {
        if (initialRequest) {
            let pickerNibName = "DemoColorPickerViewController"
            guard bundle.loadNibNamed(pickerNibName, owner: self, topLevelObjects: nil) else { fatalError() }
        }

        return pickerView
    }
    
    public func setColor(newColor: NSColor) {
        renderColor(newColor)
    }

    public override var provideNewButtonImage: NSImage {
        let icon = bundle.imageForResource("ToolbarIcon")!
        return icon
    }

    public override var minContentSize: NSSize {
        return NSSize(width: 300, height: 400)
    }


    @IBAction func selectRed(sender: AnyObject) {
        colorPanel.color = NSColor.redColor()
    }
    
    @IBAction func selectBlue(sender: AnyObject) {
        colorPanel.color = NSColor.blueColor()
    }
    
    private func renderColor(color: NSColor) {
        selectedColorRenderingView.wantsLayer = true
        selectedColorRenderingView.layer!.backgroundColor = color.CGColor
        selectedColorValueLabel.stringValue = "color: \(color)"
    }
}
