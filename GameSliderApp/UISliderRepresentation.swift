//
//  UISliderRepresentation.swift
//  GameSliderApp
//
//  Created by Zaki on 21.06.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = sliderValue
        slider.thumbTintColor = .systemPink
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged(_:)),
            for: .valueChanged
        )
        return slider
    }
    
    func transparencyValue() -> CGFloat {
        let value = Double(100 - abs(targetValue - lround(Double(sliderValue))))
        return CGFloat(value / 100.0)
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = UIColor.systemPink.withAlphaComponent(transparencyValue())
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        let parent: UISliderRepresentation
        
        init(_ parent: UISliderRepresentation) {
            self.parent = parent
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            parent.sliderValue = sender.value
        }
    }
}


struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(sliderValue: .constant(12), targetValue: .constant(32))
    }
}
