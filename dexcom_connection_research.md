# Dexcom Connection Research for DexAlarms+

This document outlines the research findings on implementing a connection to Dexcom One+ sensors for the DexAlarms+ app.

## Overview

The DexAlarms+ app needs to establish a direct Bluetooth connection with Dexcom One+ sensors to receive glucose readings in real-time. This functionality is critical for providing timely alarms and notifications to users.

## G7SensorKit Implementation

The most promising approach for connecting to Dexcom One+ sensors is to leverage the G7SensorKit implementation from the iAPS project. This kit provides a robust framework for establishing and maintaining connections to Dexcom sensors.

### Key Components

1. **G7CGMManager**: The main class responsible for managing the connection to the Dexcom sensor.
2. **G7Sensor**: Represents a Dexcom sensor and provides methods for interacting with it.
3. **G7GlucoseSample**: Data structure representing a glucose reading from the sensor.

### Connection Process

The connection process involves the following steps:

1. **Scanning for Sensors**: Using CoreBluetooth to discover nearby Dexcom sensors.
2. **Establishing Connection**: Connecting to the sensor and authenticating if necessary.
3. **Receiving Data**: Setting up notifications to receive glucose readings.
4. **Processing Readings**: Converting raw data into meaningful glucose values.
5. **Maintaining Connection**: Implementing reconnection logic for when the connection is lost.

### Code Implementation

The key classes and methods for implementing the connection are:

```swift
// Main manager class
class G7CGMManager {
    // Scan for available sensors
    func scanForSensor()
    
    // Connect to a specific sensor
    func connectToSensor(_ sensor: G7Sensor)
    
    // Disconnect from the current sensor
    func disconnect()
    
    // Check if a sensor is connected
    var isConnected: Bool
    
    // Current glucose reading
    var latestReading: G7GlucoseSample?
    
    // Delegate for receiving updates
    weak var delegate: G7CGMManagerDelegate?
}

// Delegate protocol for receiving updates
protocol G7CGMManagerDelegate: AnyObject {
    // Called when a new glucose reading is received
    func cgmManager(_ manager: G7CGMManager, didUpdateWith reading: G7GlucoseSample)
    
    // Called when the connection state changes
    func cgmManager(_ manager: G7CGMManager, didUpdateConnectionState state: G7ConnectionState)
}
```

### Background Operation

To ensure continuous monitoring, the app needs to operate in the background:

1. **Background Modes**: Enable the "Uses Bluetooth LE accessories" background mode in the app's capabilities.
2. **State Restoration**: Implement CoreBluetooth state restoration to reconnect after app termination.
3. **Background Task Scheduling**: Use BackgroundTasks framework to schedule periodic updates.

## Integration with DexAlarms+

To integrate G7SensorKit with DexAlarms+, we'll need to:

1. **Fork the Repository**: Create a fork of the iAPS repository to access G7SensorKit.
2. **Extract G7SensorKit**: Copy the G7SensorKit directory into our project's Dependencies folder.
3. **Add as Dependency**: Add G7SensorKit as a dependency in our Xcode project.
4. **Create Service Layer**: Implement a service class that wraps G7CGMManager and provides a clean API for our app.

### Service Layer Implementation

```swift
import Foundation
import G7SensorKit
import Combine

class DexcomSensorService: ObservableObject {
    // Published properties for UI updates
    @Published var currentGlucose: Double?
    @Published var glucoseTrend: GlucoseTrend = .flat
    @Published var lastReadingDate: Date?
    @Published var isConnected: Bool = false
    
    // G7SensorKit manager
    private var cgmManager: G7CGMManager
    
    init() {
        cgmManager = G7CGMManager()
        cgmManager.delegate = self
    }
    
    // Start scanning for and connecting to Dexcom sensors
    func startSensor() {
        cgmManager.scanForSensor()
    }
    
    // Disconnect from sensor
    func stopSensor() {
        cgmManager.disconnect()
    }
}

// Implement delegate methods
extension DexcomSensorService: G7CGMManagerDelegate {
    func cgmManager(_ manager: G7CGMManager, didUpdateWith reading: G7GlucoseSample) {
        // Update published properties with new reading
        self.currentGlucose = reading.quantity.doubleValue(for: .milligramsPerDeciliter)
        self.glucoseTrend = reading.trend ?? .flat
        self.lastReadingDate = reading.date
    }
    
    func cgmManager(_ manager: G7CGMManager, didUpdateConnectionState state: G7ConnectionState) {
        // Update connection state
        self.isConnected = (state == .connected)
    }
}
```

## Permissions and Configuration

To enable Bluetooth connectivity, the following permissions need to be added to the app's Info.plist:

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>DexAlarms+ needs Bluetooth access to connect to your Dexcom sensor and monitor your glucose levels.</string>

<key>NSBluetoothPeripheralUsageDescription</key>
<string>DexAlarms+ needs Bluetooth access to connect to your Dexcom sensor and monitor your glucose levels.</string>

<key>UIBackgroundModes</key>
<array>
    <string>bluetooth-central</string>
</array>
```

## Challenges and Considerations

1. **Battery Usage**: Continuous Bluetooth monitoring can impact battery life. Implement efficient connection management.
2. **Connection Reliability**: Bluetooth connections can be unstable. Implement robust reconnection logic.
3. **Data Accuracy**: Validate glucose readings to ensure accuracy before triggering alarms.
4. **Compatibility**: Test with different Dexcom One+ sensor versions to ensure compatibility.
5. **Legal Considerations**: Ensure compliance with regulatory requirements for medical data handling.

## Conclusion

The G7SensorKit from the iAPS project provides a solid foundation for implementing Dexcom One+ sensor connectivity in DexAlarms+. By leveraging this existing implementation and adding our own service layer, we can focus on building the alarm functionality that is the core value proposition of our app.
