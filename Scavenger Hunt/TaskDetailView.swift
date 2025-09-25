//
//  TaskDetailView.swift
//  Scavenger Hunt
//
//  Created by sneha siri nagabathula on 9/25/25.
//


import SwiftUI
import MapKit

struct TaskDetailView: View {
    @Binding var task: Task
    @State private var showPicker = false
    @State private var selectedImage: UIImage?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(task.title)
                    .font(.title)
                Text(task.description)
                    .padding(.bottom)

                if let image = task.attachedPhoto {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }

                Button("Attach Photo") {
                    showPicker = true
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $showPicker) {
                    PhotoPicker(selectedImage: $selectedImage)
                }

                if let location = task.photoLocation {
                    Map(coordinateRegion: .constant(MKCoordinateRegion(
                        center: location,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )), annotationItems: [task]) { item in
                        MapMarker(coordinate: item.photoLocation!, tint: .blue)
                    }
                    .frame(height: 200)
                }
            }
            .padding()
        }
        .onChange(of: selectedImage) { newImage in
            if let img = newImage {
                task.attachedPhoto = img
                task.isCompleted = true
                // For now, fake location: center of SF
                task.photoLocation = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
            }
        }
    }
}
