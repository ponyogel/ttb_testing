# Jenkins Pipeline Setup

## Overview
This Jenkins pipeline executes Cypress automated tests for both API and Web features.

## Features
- **Parameterized builds**: Choose to run API tests, Web tests, or both
- **Browser selection**: Run tests on Chrome, Electron, Firefox, or Edge
- **Artifact archiving**: Automatically saves screenshots and videos
- **Test reporting**: Publishes JUnit test results

## Setup Instructions

### 1. Jenkins Prerequisites
- Jenkins with Pipeline plugin installed
- Node.js plugin or Node.js installed on Jenkins agent
- Git plugin for source control

### 2. Create Jenkins Pipeline Job
1. Go to Jenkins → New Item
2. Enter job name (e.g., "Cypress-Automation-Tests")
3. Select "Pipeline" and click OK
4. Under "Pipeline" section, select "Pipeline script from SCM"
5. Choose your SCM (Git) and provide repository URL
6. Set Script Path to: `automate_script/Jenkinsfile`
7. Save the configuration

### 3. Running the Pipeline
- Click "Build with Parameters"
- Select TEST_SUITE: `all`, `api`, or `web`
- Select BROWSER: `chrome`, `electron`, `firefox`, or `edge`
- Click "Build"

## Pipeline Stages

1. **Checkout**: Pulls the latest code from repository
2. **Install Dependencies**: Runs `npm ci` to install packages
3. **Run API Tests**: Executes tests in `cypress/e2e/api/` (conditional)
4. **Run Web Tests**: Executes tests in `cypress/e2e/web/` (conditional)

## Artifacts
- Screenshots: `cypress/screenshots/`
- Videos: `cypress/videos/`
- Test Results: `cypress/results/` (if JUnit reporter configured)

## Optional Enhancements

### Add JUnit Reporter
Update `package.json`:
```json
"devDependencies": {
  "cypress-multi-reporters": "^1.6.4",
  "mocha-junit-reporter": "^2.2.1"
}
```

Update `cypress.config.ts`:
```typescript
reporter: 'junit',
reporterOptions: {
  mochaFile: 'cypress/results/test-results-[hash].xml',
  toConsole: true
}
```

### Add Slack/Email Notifications
Add to Jenkinsfile `post` section:
```groovy
failure {
    emailext (
        subject: "Test Failed: ${env.JOB_NAME} - ${env.BUILD_NUMBER}",
        body: "Check console output at ${env.BUILD_URL}",
        to: "team@example.com"
    )
}
```
