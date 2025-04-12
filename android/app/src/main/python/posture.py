# posture_analyzer.py

import cv2
import math as m
import mediapipe as mp
import json

def findDistance(x1, y1, x2, y2):
    return m.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)

def findAngle(x1, y1, x2, y2):
    try:
        theta = m.acos((y2 - y1) * (-y1) / (m.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2) * y1))
        return (180 / m.pi) * theta
    except:
        return 90  # default fallback angle

def analyze_posture(video_path):
    mp_pose = mp.solutions.pose
    pose = mp_pose.Pose()

    cap = cv2.VideoCapture(video_path)
    fps = int(cap.get(cv2.CAP_PROP_FPS)) or 30

    good_frames = 0
    bad_frames = 0
    total_neck = 0.0
    total_torso = 0.0
    count = 0

    while cap.isOpened():
        success, image = cap.read()
        if not success:
            break

        h, w = image.shape[:2]
        image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        results = pose.process(image_rgb)

        if results.pose_landmarks:
            try:
                lm = results.pose_landmarks.landmark

                l_shldr = lm[mp_pose.PoseLandmark.LEFT_SHOULDER]
                r_shldr = lm[mp_pose.PoseLandmark.RIGHT_SHOULDER]
                l_ear = lm[mp_pose.PoseLandmark.LEFT_EAR]
                l_hip = lm[mp_pose.PoseLandmark.LEFT_HIP]

                l_shldr_x, l_shldr_y = int(l_shldr.x * w), int(l_shldr.y * h)
                r_shldr_x, r_shldr_y = int(r_shldr.x * w), int(r_shldr.y * h)
                l_ear_x, l_ear_y = int(l_ear.x * w), int(l_ear.y * h)
                l_hip_x, l_hip_y = int(l_hip.x * w), int(l_hip.y * h)

                neck_angle = findAngle(l_shldr_x, l_shldr_y, l_ear_x, l_ear_y)
                torso_angle = findAngle(l_hip_x, l_hip_y, l_shldr_x, l_shldr_y)

                if neck_angle < 40 and torso_angle < 10:
                    good_frames += 1
                else:
                    bad_frames += 1

                total_neck += neck_angle
                total_torso += torso_angle
                count += 1

            except Exception as e:
                continue  # skip this frame if calculation fails

    cap.release()

    result = {
        "good_time": round((good_frames / fps), 2),
        "bad_time": round((bad_frames / fps), 2),
        "avg_neck": round((total_neck / count), 2) if count > 0 else 0,
        "avg_torso": round((total_torso / count), 2) if count > 0 else 0
    }

    # Return as JSON string for Flutter/Chaquopy compatibility
    return json.dumps(result)
