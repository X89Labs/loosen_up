//  StretchLibrary.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.

import Foundation

struct StretchLibrary {
    static let allStretches: [Stretch] = [
        Stretch(id: UUID(), name: "Neck Circles", bodyPart: "Neck", durationInSeconds: 30, restSeconds: 10, videoName: "neck_circles.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Neck Side Stretch", bodyPart: "Neck", durationInSeconds: 30, restSeconds: 10, videoName: "neck_side_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Shoulder Rolls", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "shoulder_rolls.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Arm Circles", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "arm_circles.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Shoulder Stretch", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "shoulder_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Cross-Body Shoulder Stretch", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "cross_body_shoulder_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Triceps Stretch", bodyPart: "Arms", durationInSeconds: 30, restSeconds: 10, videoName: "triceps_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Wrist Flexor Stretch", bodyPart: "Forearms", durationInSeconds: 30, restSeconds: 10, videoName: "wrist_flexor_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Wrist Extensor Stretch", bodyPart: "Forearms", durationInSeconds: 30, restSeconds: 10, videoName: "wrist_extensor_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Standing Side Bend", bodyPart: "Side Body", durationInSeconds: 30, restSeconds: 10, videoName: "standing_side_bend.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Side-Lying Side Bend", bodyPart: "Side Body", durationInSeconds: 30, restSeconds: 10, videoName: "side_lying_side_bend.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Cat-Cow Stretch", bodyPart: "Spine", durationInSeconds: 30, restSeconds: 10, videoName: "cat_cow_stretch.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Thread the Needle", bodyPart: "Shoulders", durationInSeconds: 30, restSeconds: 10, videoName: "thread_the_needle.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Child’s Pose", bodyPart: "Back", durationInSeconds: 30, restSeconds: 10, videoName: "childs_pose.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Seated Forward Fold", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "seated_forward_fold.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Standing Forward Fold", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "standing_forward_fold.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Downward Dog", bodyPart: "Full Body", durationInSeconds: 30, restSeconds: 10, videoName: "downward_dog.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Upward Dog", bodyPart: "Chest", durationInSeconds: 30, restSeconds: 10, videoName: "upward_dog.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Cobra Stretch", bodyPart: "Back", durationInSeconds: 30, restSeconds: 10, videoName: "cobra_stretch.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Sphinx Stretch", bodyPart: "Back", durationInSeconds: 30, restSeconds: 10, videoName: "sphinx_stretch.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Chest Opener on Wall", bodyPart: "Chest", durationInSeconds: 30, restSeconds: 10, videoName: "chest_opener_wall.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Doorway Chest Stretch", bodyPart: "Chest", durationInSeconds: 30, restSeconds: 10, videoName: "doorway_chest_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Standing Quad Stretch", bodyPart: "Quads", durationInSeconds: 30, restSeconds: 10, videoName: "standing_quad_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Lying Quad Stretch", bodyPart: "Quads", durationInSeconds: 30, restSeconds: 10, videoName: "lying_quad_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Hip Flexor Lunge Stretch", bodyPart: "Hip Flexors", durationInSeconds: 30, restSeconds: 10, videoName: "hip_flexor_lunge_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Pigeon Pose", bodyPart: "Hips", durationInSeconds: 30, restSeconds: 10, videoName: "pigeon_pose.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Seated Figure Four Stretch", bodyPart: "Glutes", durationInSeconds: 30, restSeconds: 10, videoName: "seated_figure_four_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Standing Hamstring Stretch", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "standing_hamstring_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Lying Hamstring Stretch (with strap)", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "lying_hamstring_strap.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Supine Knee to Chest", bodyPart: "Lower Back", durationInSeconds: 30, restSeconds: 10, videoName: "supine_knee_to_chest.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Supine Twist", bodyPart: "Spine", durationInSeconds: 30, restSeconds: 10, videoName: "supine_twist.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Seated Spinal Twist", bodyPart: "Spine", durationInSeconds: 30, restSeconds: 10, videoName: "seated_spinal_twist.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Butterfly Stretch", bodyPart: "Groin", durationInSeconds: 30, restSeconds: 10, videoName: "butterfly_stretch.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Frog Stretch", bodyPart: "Groin", durationInSeconds: 30, restSeconds: 10, videoName: "frog_stretch.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Happy Baby Pose", bodyPart: "Lower Back", durationInSeconds: 30, restSeconds: 10, videoName: "happy_baby_pose.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Reclined Bound Angle Pose", bodyPart: "Hips", durationInSeconds: 30, restSeconds: 10, videoName: "reclined_bound_angle_pose.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Calf Stretch on Wall", bodyPart: "Calves", durationInSeconds: 30, restSeconds: 10, videoName: "calf_stretch_wall.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Standing Calf Stretch", bodyPart: "Calves", durationInSeconds: 30, restSeconds: 10, videoName: "standing_calf_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Toe Touch Reach", bodyPart: "Hamstrings", durationInSeconds: 30, restSeconds: 10, videoName: "toe_touch_reach.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Ankle Circles", bodyPart: "Ankles", durationInSeconds: 30, restSeconds: 10, videoName: "ankle_circles.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Ankle Pumps", bodyPart: "Ankles", durationInSeconds: 30, restSeconds: 10, videoName: "ankle_pumps.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Plantar Fascia Stretch", bodyPart: "Feet", durationInSeconds: 30, restSeconds: 10, videoName: "plantar_fascia_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Foot Rollout (with ball)", bodyPart: "Feet", durationInSeconds: 30, restSeconds: 10, videoName: "foot_rollout_ball.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Wall Angels", bodyPart: "Upper Back", durationInSeconds: 30, restSeconds: 10, videoName: "wall_angels.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Scapular Retraction", bodyPart: "Upper Back", durationInSeconds: 30, restSeconds: 10, videoName: "scapular_retraction.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Lat Stretch on Wall", bodyPart: "Lats", durationInSeconds: 30, restSeconds: 10, videoName: "lat_stretch_wall.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Wall Sit (active stretch)", bodyPart: "Legs", durationInSeconds: 30, restSeconds: 10, videoName: "wall_sit_active.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Deep Squat Hold", bodyPart: "Hips", durationInSeconds: 30, restSeconds: 10, videoName: "deep_squat_hold.mp4", isBilateral: false, parentId: nil),
        Stretch(id: UUID(), name: "Kneeling Shin Stretch", bodyPart: "Shins", durationInSeconds: 30, restSeconds: 10, videoName: "kneeling_shin_stretch.mp4", isBilateral: true, parentId: nil),
        Stretch(id: UUID(), name: "Toe Squat Stretch", bodyPart: "Feet", durationInSeconds: 30, restSeconds: 10, videoName: "toe_squat_stretch.mp4", isBilateral: true, parentId: nil)
    ]

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
            id: UUID(),
            name: name,
            bodyPart: "Unknown",
            durationInSeconds: 30,
            restSeconds: 10,
            videoName: "",
            isBilateral: false,
            parentId: nil
        )
    }
}
