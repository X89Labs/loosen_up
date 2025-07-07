//
//  StretchLibrary.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import Foundation

struct Stretch: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var bodyPart: String
    var duration: Int
    var restSeconds: Int
    var videoName: String?
}

struct StretchLibrary {
    static let allStretches: [Stretch] = [
          Stretch(id: UUID(), name: "Downward-Facing Dog", bodyPart: "Full Body", duration: 30, restSeconds: 10, videoName: "downward_facing_dog.mp4"),
    Stretch(id: UUID(), name: "Child’s Pose", bodyPart: "Back", duration: 30, restSeconds: 10, videoName: "childs_pose.mp4"),
    Stretch(id: UUID(), name: "Cobra Pose", bodyPart: "Back", duration: 30, restSeconds: 10, videoName: "cobra_pose.mp4"),
    Stretch(id: UUID(), name: "Upward-Facing Dog", bodyPart: "Chest", duration: 30, restSeconds: 10, videoName: "upward_facing_dog.mp4"),
    Stretch(id: UUID(), name: "Cat-Cow Stretch", bodyPart: "Spine", duration: 30, restSeconds: 10, videoName: "cat_cow_stretch.mp4"),
    Stretch(id: UUID(), name: "Seated Forward Fold", bodyPart: "Hamstrings", duration: 30, restSeconds: 10, videoName: "seated_forward_fold.mp4"),
    Stretch(id: UUID(), name: "Standing Forward Fold", bodyPart: "Hamstrings", duration: 30, restSeconds: 10, videoName: "standing_forward_fold.mp4"),
    Stretch(id: UUID(), name: "Triangle Pose", bodyPart: "Legs", duration: 30, restSeconds: 10, videoName: "triangle_pose.mp4"),
    Stretch(id: UUID(), name: "Warrior I", bodyPart: "Legs", duration: 30, restSeconds: 10, videoName: "warrior_1.mp4"),
    Stretch(id: UUID(), name: "Warrior II", bodyPart: "Legs", duration: 30, restSeconds: 10, videoName: "warrior_2.mp4"),
    Stretch(id: UUID(), name: "Warrior III", bodyPart: "Legs", duration: 30, restSeconds: 10, videoName: "warrior_3.mp4"),
    Stretch(id: UUID(), name: "Pigeon Pose", bodyPart: "Hips", duration: 30, restSeconds: 10, videoName: "pigeon_pose.mp4"),
    Stretch(id: UUID(), name: "Lizard Pose", bodyPart: "Hips", duration: 30, restSeconds: 10, videoName: "lizard_pose.mp4"),
    Stretch(id: UUID(), name: "Bridge Pose", bodyPart: "Glutes", duration: 30, restSeconds: 10, videoName: "bridge_pose.mp4"),
    Stretch(id: UUID(), name: "Reclined Twist", bodyPart: "Spine", duration: 30, restSeconds: 10, videoName: "reclined_twist.mp4"),
    Stretch(id: UUID(), name: "Happy Baby Pose", bodyPart: "Lower Back", duration: 30, restSeconds: 10, videoName: "happy_baby_pose.mp4"),
    Stretch(id: UUID(), name: "Half Lord of the Fishes", bodyPart: "Spine", duration: 30, restSeconds: 10, videoName: "half_lord_of_fishes.mp4"),
    Stretch(id: UUID(), name: "Butterfly Stretch", bodyPart: "Groin", duration: 30, restSeconds: 10, videoName: "butterfly_stretch.mp4"),
    Stretch(id: UUID(), name: "Sphinx Pose", bodyPart: "Lower Back", duration: 30, restSeconds: 10, videoName: "sphinx_pose.mp4"),
    Stretch(id: UUID(), name: "Legs-Up-The-Wall", bodyPart: "Legs", duration: 30, restSeconds: 10, videoName: "legs_up_wall.mp4"),
    Stretch(id: UUID(), name: "Low Lunge", bodyPart: "Hip Flexors", duration: 30, restSeconds: 10, videoName: "low_lunge.mp4"),
    Stretch(id: UUID(), name: "Chair Pose", bodyPart: "Legs", duration: 30, restSeconds: 10, videoName: "chair_pose.mp4"),
    Stretch(id: UUID(), name: "Eagle Arms", bodyPart: "Shoulders", duration: 30, restSeconds: 10, videoName: "eagle_arms.mp4"),
    Stretch(id: UUID(), name: "Thread the Needle", bodyPart: "Shoulders", duration: 30, restSeconds: 10, videoName: "thread_the_needle.mp4"),
    Stretch(id: UUID(), name: "Side Angle Pose", bodyPart: "Side Body", duration: 30, restSeconds: 10, videoName: "side_angle_pose.mp4"),
    Stretch(id: UUID(), name: "Neck Side Stretch", bodyPart: "Neck", duration: 30, restSeconds: 10, videoName: "neck_side_stretch.mp4"),
    Stretch(id: UUID(), name: "Chin-to-Chest Stretch", bodyPart: "Neck", duration: 30, restSeconds: 10, videoName: "chin_chest_stretch.mp4"),
    Stretch(id: UUID(), name: "Shoulder Rolls", bodyPart: "Shoulders", duration: 30, restSeconds: 10, videoName: "shoulder_rolls.mp4"),
    Stretch(id: UUID(), name: "Cross-Body Shoulder Stretch", bodyPart: "Shoulders", duration: 30, restSeconds: 10, videoName: "cross_body_shoulder.mp4"),
    Stretch(id: UUID(), name: "Overhead Triceps Stretch", bodyPart: "Arms", duration: 30, restSeconds: 10, videoName: "triceps_stretch.mp4"),
    Stretch(id: UUID(), name: "Wrist Flexor Stretch", bodyPart: "Forearms", duration: 30, restSeconds: 10, videoName: "wrist_flexor.mp4"),
    Stretch(id: UUID(), name: "Wrist Extensor Stretch", bodyPart: "Forearms", duration: 30, restSeconds: 10, videoName: "wrist_extensor.mp4"),
    Stretch(id: UUID(), name: "Side Body Stretch", bodyPart: "Side Body", duration: 30, restSeconds: 10, videoName: "side_body_stretch.mp4"),
    Stretch(id: UUID(), name: "Standing Quad Stretch", bodyPart: "Quads", duration: 30, restSeconds: 10, videoName: "standing_quad_stretch.mp4"),
    Stretch(id: UUID(), name: "Lying Quad Stretch", bodyPart: "Quads", duration: 30, restSeconds: 10, videoName: "lying_quad_stretch.mp4"),
    Stretch(id: UUID(), name: "Hamstring Stretch", bodyPart: "Hamstrings", duration: 30, restSeconds: 10, videoName: "hamstring_stretch.mp4"),
    Stretch(id: UUID(), name: "Standing Hamstring Stretch", bodyPart: "Hamstrings", duration: 30, restSeconds: 10, videoName: "standing_hamstring.mp4"),
    Stretch(id: UUID(), name: "Calf Stretch", bodyPart: "Calves", duration: 30, restSeconds: 10, videoName: "calf_stretch.mp4"),
    Stretch(id: UUID(), name: "Toe Touch", bodyPart: "Hamstrings", duration: 30, restSeconds: 10, videoName: "toe_touch.mp4"),
    Stretch(id: UUID(), name: "Figure Four Stretch", bodyPart: "Glutes", duration: 30, restSeconds: 10, videoName: "figure_four_stretch.mp4"),
    Stretch(id: UUID(), name: "Kneeling Hip Flexor Stretch", bodyPart: "Hip Flexors", duration: 30, restSeconds: 10, videoName: "kneeling_hip_flexor.mp4"),
    Stretch(id: UUID(), name: "Frog Stretch", bodyPart: "Groin", duration: 30, restSeconds: 10, videoName: "frog_stretch.mp4"),
    Stretch(id: UUID(), name: "Seated Spinal Twist", bodyPart: "Spine", duration: 30, restSeconds: 10, videoName: "seated_spinal_twist.mp4"),
    Stretch(id: UUID(), name: "Wall Chest Opener", bodyPart: "Chest", duration: 30, restSeconds: 10, videoName: "wall_chest_opener.mp4"),
    Stretch(id: UUID(), name: "Chest Expansion Stretch", bodyPart: "Chest", duration: 30, restSeconds: 10, videoName: "chest_expansion.mp4"),
    Stretch(id: UUID(), name: "Side-Lying Quad Stretch", bodyPart: "Quads", duration: 30, restSeconds: 10, videoName: "side_lying_quad.mp4"),
    Stretch(id: UUID(), name: "Supine Knee-to-Chest Stretch", bodyPart: "Lower Back", duration: 30, restSeconds: 10, videoName: "knee_to_chest.mp4"),
    Stretch(id: UUID(), name: "Supine Hamstring Stretch", bodyPart: "Hamstrings", duration: 30, restSeconds: 10, videoName: "supine_hamstring.mp4"),
    Stretch(id: UUID(), name: "Couch Stretch", bodyPart: "Hip Flexors", duration: 30, restSeconds: 10, videoName: "couch_stretch.mp4")
    ]
}
