# EventEase - Blazor Event Management Application

A comprehensive Blazor Server application for managing events, user registration, and attendance tracking.

## Features

- **Event Management**: Create, view, and edit events
- **User Registration**: Form validation and user session management
- **Event Registration**: Users can register for events with capacity limits
- **Attendance Tracking**: Visual progress tracking for event attendance
- **Responsive Design**: Bootstrap-based UI that works on all devices

## Project Structure

```
EventEase/
├── Components/
│   ├── EventCard.razor          # Event display with two-way data binding
│   ├── RegistrationForm.razor   # User registration with validation
│   └── AttendanceTracker.razor  # Attendance visualization
├── Models/
│   └── Event.cs                 # Event data model
├── Services/
│   ├── EventService.cs          # Event management service
│   └── UserSessionService.cs    # User session state management
├── Pages/
│   ├── Index.razor              # Main events listing
│   ├── Register.razor           # User registration page
│   ├── Attendance.razor         # Attendance tracking page
│   └── Manage.razor             # Event management page
└── Shared/
    └── MainLayout.razor         # Main application layout
```

## How Microsoft Copilot Assisted in Development

### Activity 1: Generating Foundational Code
- **Event Card Component**: Copilot helped generate the initial EventCard component structure with proper parameter binding and event handling
- **Two-way Data Binding**: Assisted in implementing @bind directives for real-time form updates
- **Component Architecture**: Suggested proper component separation and parameter passing patterns

### Activity 2: Debugging and Optimization
- **Routing Issues**: Copilot identified missing route parameters and helped fix navigation problems
- **Input Validation**: Assisted in implementing proper form validation with DataAnnotations
- **Performance Optimization**: Suggested using StateHasChanged() strategically and implementing proper component lifecycle methods
- **Error Handling**: Helped implement proper error boundaries and user-friendly error messages

### Activity 3: Advanced Features Implementation
- **Registration Form**: Copilot generated comprehensive form validation with custom error messages
- **State Management**: Assisted in creating the UserSessionService for managing user sessions across components
- **Attendance Tracker**: Helped implement visual progress tracking with Bootstrap progress bars
- **Service Integration**: Guided the implementation of dependency injection for services

### Key Copilot Contributions:
1. **Code Generation**: Rapid scaffolding of components and services
2. **Best Practices**: Suggested proper Blazor patterns and conventions
3. **Validation Logic**: Implemented comprehensive form validation
4. **UI/UX Improvements**: Bootstrap integration and responsive design
5. **Performance Optimization**: Efficient state management and component updates
6. **Error Handling**: Robust error handling and user feedback

## Running the Application

1. Ensure you have .NET 8.0 SDK installed
2. Navigate to the project directory
3. Run `dotnet restore` to restore dependencies
4. Run `dotnet run` to start the application
5. Open your browser to `https://localhost:5001`

## Usage

1. **Register**: Create a user account on the Register page
2. **View Events**: Browse available events on the home page
3. **Register for Events**: Click "Register" on event cards (requires login)
4. **Track Attendance**: View attendance statistics on the Attendance page
5. **Manage Events**: Create and edit events on the Manage page

## Git Setup and Deployment

### Initial Git Setup
```bash
git init
git add .
git commit -m "Initial commit - EventEase Blazor application"
git remote add origin https://github.com/YOUR_USERNAME/EventEase-Blazor.git
git branch -M main
git push -u origin main
```

### Build Commands
```bash
# Restore dependencies
dotnet restore

# Build project
dotnet build

# Run locally
dotnet run

# Publish for production
dotnet publish -c Release -o ./publish
```

### Docker Deployment
```bash
# Build Docker image
docker build -t eventeaseapp .

# Run container
docker run -p 8080:80 eventeaseapp
```

### GitHub Actions
- Automated CI/CD pipeline in `.github/workflows/deploy.yml`
- Builds and tests on every push to main branch
- Creates deployment artifacts

## Technologies Used

- **Blazor Server**: For interactive web UI
- **Bootstrap 5**: For responsive styling
- **Entity Framework**: For data management (simulated with in-memory collections)
- **DataAnnotations**: For form validation
- **Dependency Injection**: For service management
- **GitHub Actions**: For CI/CD pipeline
- **Docker**: For containerized deployment