//
//  UISliderRepresentation.swift
//  GameSliderApp
//
//  Created by Zaki on 21.06.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = value
        slider.thumbTintColor = .systemPink
        slider.addTarget(context.coordinator, action: #selector(Coordinator.sliderValueChanged(_:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
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
            parent.value = sender.value
        }
    }
}


struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(value: .constant(12))
    }
}
