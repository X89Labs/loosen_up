//
//  StretchLibrary.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import Foundation

struct StretchLibrary {
    static let allStretches: [Stretch] = [
        Stretch(name: "Downward-Facing Dog", bodyPart: "Full Body", durationInSeconds: 30, restSeconds: 10, videoName: "downward_facing_dog.mp4"),
        Stretch(name: "Child's Pose", bodyPart: "Back", durationInSeconds: 30, restSeconds: 10, videoName: "childs_pose.mp4"),
        Stretch(name: "Cobra Pose", bodyPart: "Back", durationInSeconds: 30, restSeconds: 10, videoName: "cobra_pose.mp4"),
        Stretch(name: "Upward-Facing Dog", bodyPart: "Chest", durationInSeconds: 30, restSeconds: 10, videoName: "upward_facing_dog.mp4"),
        Stretch(name: "Cat-Cow Stretch", bodyPart: "Spine", durationInSeconds: 30, restSeconds: 10, videoName: "cat_cow_stretch.mp4"),
        Stretch(name: "Seated Forward Fold", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "seated_forward_fold.mp4"),
        Stretch(name: "Standing Forward Fold", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "standing_forward_fold.mp4"),
        Stretch(name: "Triangle Pose", bodyPart: "Legs", durationInSeconds: 30, restSeconds: 10, videoName: "triangle_pose.mp4"),
        Stretch(name: "Warrior I", bodyPart: "Legs", durationInSeconds: 30, restSeconds: 10, videoName: "warrior_1.mp4"),
        Stretch(name: "Warrior II", bodyPart: "Legs", durationInSeconds: 30, restSeconds: 10, videoName: "warrior_2.mp4"),
        Stretch(name: "Warrior III", bodyPart: "Legs", durationInSeconds: 30, restSeconds: 10, videoName: "warrior_3.mp4"),
        Stretch(name: "Pigeon Pose", bodyPart: "Hips", durationInSeconds: 30, restSeconds: 10, videoName: "pigeon_pose.mp4"),
        Stretch(name: "Lizard Pose", bodyPart: "Hips", durationInSeconds: 30, restSeconds: 10, videoName: "lizard_pose.mp4"),
        Stretch(name: "Bridge Pose", bodyPart: "Glutes", durationInSeconds: 30, restSeconds: 10, videoName: "bridge_pose.mp4"),
        Stretch(name: "Reclined Twist", bodyPart: "Spine", durationInSeconds: 30, restSeconds: 10, videoName: "reclined_twist.mp4"),
        Stretch(name: "Happy Baby Pose", bodyPart: "Lower Back", durationInSeconds: 30, restSeconds: 10, videoName: "happy_baby_pose.mp4"),
        Stretch(name: "Half Lord of the Fishes", bodyPart: "Spine", durationInSeconds: 30, restSeconds: 10, videoName: "half_lord_of_fishes.mp4"),
        Stretch(name: "Butterfly Stretch", bodyPart: "Groin", durationInSeconds: 30, restSeconds: 10, videoName: "butterfly_stretch.mp4"),
        Stretch(name: "Sphinx Pose", bodyPart: "Lower Back", durationInSeconds: 30, restSeconds: 10, videoName: "sphinx_pose.mp4"),
        Stretch(name: "Legs-Up-The-Wall", bodyPart: "Legs", durationInSeconds: 30, restSeconds: 10, videoName: "legs_up_wall.mp4"),
        Stretch(name: "Low Lunge", bodyPart: "Hip Flexors", durationInSeconds: 30, restSeconds: 10, videoName: "low_lunge.mp4"),
        Stretch(name: "Chair Pose", bodyPart: "Legs", durationInSeconds: 30, restSeconds: 10, videoName: "chair_pose.mp4"),
        Stretch(name: "Eagle Arms", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "eagle_arms.mp4"),
        Stretch(name: "Thread the Needle", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "thread_the_needle.mp4"),
        Stretch(name: "Side Angle Pose", bodyPart: "Side Body", durationInSeconds: 30, restSeconds: 10, videoName: "side_angle_pose.mp4"),
        Stretch(name: "Neck Side Stretch", bodyPart: "Neck", durationInSeconds: 30, restSeconds: 10, videoName: "neck_side_stretch.mp4"),
        Stretch(name: "Chin-to-Chest Stretch", bodyPart: "Neck", durationInSeconds: 30, restSeconds: 10, videoName: "chin_chest_stretch.mp4"),
        Stretch(name: "Shoulder Rolls", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "shoulder_rolls.mp4"),
        Stretch(name: "Cross-Body Shoulder Stretch", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "cross_body_shoulder.mp4"),
        Stretch(name: "Overhead Triceps Stretch", bodyPart: "Arms", durationInSeconds: 30, restSeconds: 10, videoName: "triceps_stretch.mp4"),
        Stretch(name: "Wrist Flexor Stretch", bodyPart: "Forearms", durationInSeconds: 30, restSeconds: 10, videoName: "wrist_flexor.mp4"),
        Stretch(name: "Wrist Extensor Stretch", bodyPart: "Forearms", durationInSeconds: 30, restSeconds: 10, videoName: "wrist_extensor.mp4"),
        Stretch(name: "Side Body Stretch", bodyPart: "Side Body", durationInSeconds: 30, restSeconds: 10, videoName: "side_body_stretch.mp4"),
        Stretch(name: "Standing Quad Stretch", bodyPart: "Quads", durationInSeconds: 30, restSeconds: 10, videoName: "standing_quad_stretch.mp4"),
        Stretch(name: "Lying Quad Stretch", bodyPart: "Quads", durationInSeconds: 30, restSeconds: 10, videoName: "lying_quad_stretch.mp4"),
        Stretch(name: "Hamstring Stretch", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "hamstring_stretch.mp4"),
        Stretch(name: "Standing Hamstring Stretch", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "standing_hamstring.mp4"),
        Stretch(name: "Calf Stretch", bodyPart: "Calves", durationInSeconds: 30, restSeconds: 10, videoName: "calf_stretch.mp4"),
        Stretch(name: "Toe Touch", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "toe_touch.mp4"),
        Stretch(name: "Figure Four Stretch", bodyPart: "Glutes", durationInSeconds: 30, restSeconds: 10, videoName: "figure_four_stretch.mp4"),
        Stretch(name: "Kneeling Hip Flexor Stretch", bodyPart: "Hip Flexors", durationInSeconds: 30, restSeconds: 10, videoName: "kneeling_hip_flexor.mp4"),
        Stretch(name: "Frog Stretch", bodyPart: "Groin", durationInSeconds: 30, restSeconds: 10, videoName: "frog_stretch.mp4"),
        Stretch(name: "Seated Spinal Twist", bodyPart: "Spine", durationInSeconds: 30, restSeconds: 10, videoName: "seated_spinal_twist.mp4"),
        Stretch(name: "Wall Chest Opener", bodyPart: "Chest", durationInSeconds: 30, restSeconds: 10, videoName: "wall_chest_opener.mp4"),
        Stretch(name: "Chest Expansion Stretch", bodyPart: "Chest", durationInSeconds: 30, restSeconds: 10, videoName: "chest_expansion.mp4"),
        Stretch(name: "Side-Lying Quad Stretch", bodyPart: "Quads", durationInSeconds: 30, restSeconds: 10, videoName: "side_lying_quad.mp4"),
        Stretch(name: "Supine Knee-to-Chest Stretch", bodyPart: "Lower Back", durationInSeconds: 30, restSeconds: 10, videoName: "knee_to_chest.mp4"),
        Stretch(name: "Supine Hamstring Stretch", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "supine_hamstring.mp4"),
        Stretch(name: "Couch Stretch", bodyPart: "Hip Flexors", durationInSeconds: 30, restSeconds: 10, videoName: "couch_stretch.mp4")
    ]
    
    // Convenience methods for filtering
    static func stretches(for bodyPart: String) -> [Stretch] {
        allStretches.filter { $0.bodyPart == bodyPart }
    }
    
    static var bodyParts: [String] {
        Array(Set(allStretches.map { $0.bodyPart })).sorted()
    }
    
    static func stretch(withId id: UUID) -> Stretch? {
        allStretches.first { $0.id == id }
    }
}

extension StretchLibrary {
    static func named(_ name: String) -> Stretch {
        allStretches.first(where: { $0.name == name }) ?? Stretch(
            name: name,
            bodyPart: "Unknown",
            durationInSeconds: 30,
            restSeconds: 10,
            videoName: ""
        )
    }
}
