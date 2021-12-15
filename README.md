# Godot VoIP 🎙️🌐
![logo](https://raw.githubusercontent.com/casbrugman/godot-voip/master/icon.svg "Logo")

Godot-voip is a Godot addon which makes it very easy to setup a real time voice chat system in your Godot game. This addon also includes a demo project.

## Engine Compatibility
* **2.x**: Godot 3.2
* **3.x**: Godot 3.3
* **3.x**: Godot 3.4

## Setup

### Adding to a existing project

(A high-level multiplayer peer is required.)
1. Click on the AssetLib inside editor or go to the [Godot Asset Library](https://godotengine.org/asset-library/asset/425) to download the latest release, or you can clone/download this repository to get the latest commit.
2. Select the `addons/godot-voip` folder and move it into your Godot project. 
(**Note**: make sure the structure is still `res://addons/godot-voip`)
3. Go to project-settings/audio and enable audio input.
4. Now go to the plugins tab also inside project-settings and enable the godot-voip plugin.
5. Add either a `VoiceInstance` (one connection) or a `VoiceOrchestrator` (more than 2 participants) node to your scene.
6. Set `$VoiceInstance.recording` or `$VoiceOrchestrator.recording` to `true` and it will send your microphone input to connected participants.

### Running demo
1. Go to the templates tab in the Godot Engine project manager and look for godot-voip, or go to the [Godot Asset Library](https://godotengine.org/asset-library/asset/425) to manually download the latest release, or you can clone/download this repository to get the latest commit.
2. Open downloaded project.

### For macOS users
Users running godot-voip on macOS need to make sure the microphone format in macOS audio settings is equal to the mix-rate in Godot project-settings. 

# Documentation

## VoiceInstance <img src="https://raw.githubusercontent.com/casbrugman/godot-voip/master/addons/godot-voip/icons/VoiceInstance.svg" alt="icon" width="32"/>
This node implements a single voice connection.

### Signals
* `received_voice_data(data: PoolRealArray, from_id: int)` Emitted when voice data is received.
* `sent_voice_data(data: PoolRealArray)` Emitted when recording and data is sent.

### Properties
|Type|Name|description|
|----|----|-----------|
|`NodePath`|custom_voice_audio_stream_player|When used, the referenced `AudioStreamPlayer` will be used as output for incoming audio data.|
|`bool`|recording|If true, the VoiceInstance will process and send microhphone data to the other VoipInstance.|
|`bool`|listen|If true, the VoiceInstance will also play any microhphone data it records.|
|`float`|input_threshold|Value above which microhphone data will be sent. Set to `0` to disable.|

## VoiceOrchestrator <img src="https://raw.githubusercontent.com/casbrugman/godot-voip/master/addons/godot-voip/icons/VoiceOrchestrator.svg" alt="icon" width="32"/>
This node implements multiple voice connections. It will automatically spawn new VoiceInstances when a player connects to the server and will remove them again after they disconnect.
Interfacing with a `VoiceOrchestrator` is the same as with a `VoiceInstance`. **Does not support a custom `AudioStreamPlayer`.**

### Additional Signals
* `created_instance(id: int)` Emitted when a new `VoiceInstance` is created.
* `removed_instance(id: int)` Emitted when a `VoiceInstance` is removed.
