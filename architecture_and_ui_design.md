# Architecture and UI Design for DexAlarms+

This document outlines the architecture and user interface design for the DexAlarms+ iOS application.

## System Architecture

DexAlarms+ follows the MVVM (Model-View-ViewModel) architecture pattern to ensure a clean separation of concerns and maintainable codebase.

### Architecture Components

1. **Models**
   - Data structures representing core domain entities
   - Business logic for glucose data processing and alarm evaluation
   - Persistence layer for storing settings and historical data

2. **Views**
   - SwiftUI views for all user interface components
   - Reactive UI that updates based on data changes
   - Accessibility support for all interface elements

3. **ViewModels**
   - Bridge between Models and Views
   - Data transformation and preparation for display
   - Command handling and user interaction logic

4. **Services**
   - Bluetooth connectivity to Dexcom sensors
   - Notification management
   - Background processing
   - Health data integration

### Core Modules

#### Sensor Connection Module
- Manages Bluetooth connection to Dexcom One+ sensor
- Handles data parsing and validation
- Implements reconnection logic
- Manages background operation

#### Alarm Evaluation Module
- Processes glucose readings against alarm settings
- Determines when alarms should be triggered
- Handles predictive algorithms for early warnings
- Manages alarm state and history

#### Profile Management Module
- Stores and retrieves alarm profiles
- Handles time-based profile switching
- Manages day-specific settings
- Provides profile override functionality

#### Notification Module
- Generates local notifications for alarms
- Manages critical alerts that override system settings
- Handles notification actions (snooze, dismiss)
- Provides haptic and audio feedback

#### Data Storage Module
- Persists glucose readings and alarm events
- Stores user preferences and profiles
- Manages data retention policies
- Provides data export capabilities

## Technical Implementation

### Dependencies
- **G7SensorKit**: Forked from iAPS project for Dexcom sensor communication
- **CoreBluetooth**: For Bluetooth connectivity
- **CoreData**: For persistent storage
- **UserNotifications**: For local notifications and critical alerts
- **HealthKit**: For insulin dose data integration
- **BackgroundTasks**: For background processing
- **SwiftUI**: For user interface
- **Combine**: For reactive programming

### Data Flow
1. G7SensorKit connects to Dexcom sensor via Bluetooth
2. Glucose readings are received and processed
3. Readings are evaluated against alarm settings
4. Alarms are triggered when conditions are met
5. Notifications are presented to the user
6. User interactions are processed (snooze, dismiss)
7. Data is stored for history and analysis

### Background Operation
- Registers for background execution time
- Uses background Bluetooth processing
- Implements efficient battery usage strategies
- Handles app suspension and resumption

## User Interface Design

### Design Principles
- **Clarity**: Clear presentation of critical information
- **Accessibility**: Support for VoiceOver and dynamic type
- **Consistency**: Adherence to iOS design guidelines
- **Simplicity**: Focus on core functionality without clutter
- **Customization**: User control over appearance and behavior

### Color Scheme
- **Primary**: Blue (#007AFF) - For main UI elements
- **Secondary**: Green (#34C759) - For normal/in-range glucose
- **Warning**: Yellow (#FFCC00) - For approaching thresholds
- **Danger**: Red (#FF3B30) - For out-of-range glucose
- **Background**: System background - For compatibility with light/dark mode
- **Text**: System text colors - For accessibility and mode compatibility

### Typography
- System fonts with Dynamic Type support
- Large, bold display for current glucose reading
- Clear hierarchy of information importance

### Screen Designs

#### Home Screen
- Current glucose reading (large, central)
- Trend arrow indicating direction
- Time of last reading
- Simple trend graph (recent history)
- Active profile indicator
- Connection status indicator
- Quick access to alarm settings

#### Alarm Settings Screen
- High/low threshold settings
- Persistent condition settings
- Rate of change settings
- Sound and vibration settings
- Critical alert settings
- Test alarm button

#### Profile Management Screen
- List of defined profiles
- Profile editing interface
- Time-based activation settings
- Day-specific settings
- Manual override controls

#### History Screen
- List of recent alarms
- Glucose graph with alarm events
- Filtering options
- Basic statistics

#### Settings Screen
- General app settings
- Notification preferences
- Connection settings
- Data management options
- About and help information

### Navigation
- Tab-based navigation for main sections
- Modal presentations for focused tasks
- Clear back navigation
- Minimal depth to reduce complexity

### Accessibility
- VoiceOver support for all elements
- Dynamic Type for text scaling
- Sufficient color contrast
- Haptic feedback
- Voice announcements option

## Wireframes

Below are text descriptions of key screen wireframes:

### Home Screen
```
+----------------------------------+
|  Settings    Profile: Day   ⚙️   |
+----------------------------------+
|                                  |
|           Last reading:          |
|            2 min ago             |
|                                  |
|                                  |
|             124                  |
|              ↗                   |
|           mg/dL                  |
|                                  |
|  +----------------------------+  |
|  |                            |  |
|  |         Trend Graph        |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  Status: Connected               |
|                                  |
+----------------------------------+
| Home | Alarms | Profiles | Stats |
+----------------------------------+
```

### Alarm Settings Screen
```
+----------------------------------+
|  < Back                     Save |
+----------------------------------+
|  Alarm Settings                  |
|                                  |
|  High Glucose                    |
|  Threshold: 180 mg/dL      >     |
|                                  |
|  Low Glucose                     |
|  Threshold: 70 mg/dL       >     |
|                                  |
|  Persistent High                 |
|  After: 30 minutes         >     |
|                                  |
|  Persistent Low                  |
|  After: 15 minutes         >     |
|                                  |
|  Rapid Rise                      |
|  Rate: 2 mg/dL/min         >     |
|                                  |
|  Rapid Fall                      |
|  Rate: 2 mg/dL/min         >     |
|                                  |
|  Sound & Vibration         >     |
|                                  |
|  Critical Alerts           >     |
|                                  |
|  Test Alarms                     |
|                                  |
+----------------------------------+
```

### Profile Management Screen
```
+----------------------------------+
|  < Back                      Add |
+----------------------------------+
|  Profiles                        |
|                                  |
|  Day Profile                     |
|  Active: 7:00 AM - 10:00 PM >    |
|                                  |
|  Night Profile                   |
|  Active: 10:00 PM - 7:00 AM >    |
|                                  |
|  Weekend Profile                 |
|  Active: Sat, Sun          >     |
|                                  |
|  Exercise Profile                |
|  Manual activation         >     |
|                                  |
|  Current active: Day             |
|                                  |
|  Override current profile:       |
|  +----------------------------+  |
|  |  Select profile to apply   |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

## Implementation Considerations

### Performance
- Optimize Bluetooth operations for battery efficiency
- Minimize background processing
- Efficient data storage and retrieval
- Responsive UI even during data processing

### Testing
- Unit tests for alarm logic and data processing
- Integration tests for Bluetooth connectivity
- UI tests for critical user flows
- Manual testing with actual Dexcom sensors

### Security and Privacy
- Secure storage of health data
- No network transmission of glucose data
- Compliance with health data regulations
- Clear privacy policy

### Future Expansion
- Architecture designed to accommodate additional features
- Modular design for easy feature additions
- Extensible alarm system for new alarm types
- Prepared for Apple Watch integration
