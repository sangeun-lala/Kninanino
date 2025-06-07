//
//  NewJournalView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/09.
//

import SwiftUI
import PhotosUI

struct NewJournalView: View {
    @StateObject var viewModel = NewJournalViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if let currentUser = authViewModel.currentUser {
                Form {
                    
                    Section {
                        Picker("Project Type", selection: $viewModel.useExistingProject) {
                            Text("Existing Project").tag(true)
                            Text("New Project").tag(false)
                        }
                        .pickerStyle(.segmented)
                    }

                    if viewModel.useExistingProject {
                        Section(header: Text("Select a Project")) {
                            Picker("Project", selection: $viewModel.selectedProjectId) {
                                // Placeholder option
                                    Text("Select a Project").tag(nil as String?)
                                // Real projects
                                ForEach(viewModel.userProjects) { project in
                                    Text(project.title).tag(project.id as String?)
                                }
                            }
                        }
                    } else {
                        Section(header: Text("New Project Info")) {
                            TextField("Project Title", text: $viewModel.newProjectTitle)
                            TextField("Pattern", text: $viewModel.newProjectPattern)
                            TextField("Yarn", text: $viewModel.newProjectYarn)
                        }
                    }
                    
                    Section(header: Text("New Journal Entry for \(currentUser.username)")) {
                        TextEditor(text: $viewModel.journalEntry)
                            .frame(height: 150)
                    }
                    
                    Section(header: Text("Location ID (optional)")) {
                        TextField("Enter location ID", text: $viewModel.locationId.asTextFieldBinding())
                    }
                    
                    Section(header: Text("Photos")) {
                        PhotosPicker(
                            selection: $viewModel.selectedPhotoItems,
                            maxSelectionCount: 5,
                            matching: .images
                        ){
                            Label("Select Photos", systemImage:"photo.on.rectangle")
                        }
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.selectedImages, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipped()
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }
                    
                    Button("Save Journal") {
                        viewModel.addJournal()
                    }
                    .disabled(viewModel.useExistingProject && viewModel.selectedProjectId == nil)
                }
                .navigationTitle("New Journal")
            } else {
                ProgressView("Loading user...")
            }
        }
        .onAppear {
            print("🟣 onAppear - user: \(String(describing: authViewModel.user))")
            if let currentUser = authViewModel.currentUser {
                    viewModel.fetchProjects(for: currentUser.id ?? "")
                } else {
                    print("🔄 currentUser is nil – trying to fetch again")
                    authViewModel.fetchCurrentUser()
                }
            }
        
        .onChange(of: authViewModel.currentUser) { oldUser, newUser in
            if let user = newUser {
                viewModel.fetchProjects(for: user.id ?? "")
            }
        }
    }
}
