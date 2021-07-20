//
//  ContentView.swift
//  demo
//
//  Created by abnernat on 7/19/21.
//

import SwiftUI
import RealityKit

let urls = [
	URL(string: "https://abnernat-usdz.s3.ap-southeast-1.amazonaws.com/Nier_Automata__3D_print_figure.usdz"),
	URL(string: "https://abnernat-usdz.s3.ap-southeast-1.amazonaws.com/Sci-Fi_Android_-_Test_Object_F21.usdz"),
];

struct ContentView : View {
	@State var current = 0;
	
	var body: some View {
		VStack {
			MapView()
				.ignoresSafeArea(edges: .top)
				.frame(height: 300)
			
			CircleImage()
				.offset(y: -130)
				.padding(.bottom, -130)
			
			VStack(alignment: .leading) {
				Text("AR Demo")
					.font(.title)
				HStack {
					Text("Load 3D Object on Web")
					Spacer()
					Text("For All Mankind")
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				
				Divider()
				
				Text("2B/9S")
					.font(.title2)
				Text("Static figure of 2B/9S Automata")
			}.padding()
			
			Spacer()
		}
	}
}

struct ARViewContainer: UIViewRepresentable {
	
	func makeUIView(context: Context) -> ARView {
		
		let arView = ARView(frame: .zero)
		
		// Load the "Box" scene from the "Experience" Reality File
		let boxAnchor = try! Experience.loadBox()
		
		// Add the box anchor to the scene
		arView.scene.anchors.append(boxAnchor)
		
		return arView
	}
	
	func updateUIView(_ uiView: ARView, context: Context) {
	}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		Group {
			ContentView()
			ContentView()
		}
	}
}
#endif
