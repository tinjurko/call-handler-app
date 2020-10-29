//
//  Audio.swift
//  call-app-ios
//
//  Created by Tin Jurković on 31/10/2020.
//

import AVFoundation

func configureAudioSession() {
  print("Configuring audio session")
  let session = AVAudioSession.sharedInstance()
  do {
    try session.setCategory(.playAndRecord, mode: .voiceChat, options: [])
  } catch (let error) {
    print("Error while configuring audio session: \(error)")
  }
}

func startAudio() {
  print("Start audio...")
}

func stopAudio() {
  print("Stop audio...")
}
