#!/bin/bash

INPUT_FILE="$1.json"
OUTPUT_FILE="$1-minimal.json"

jq 'del(
  .id, .containerId, .accessTokenLifespanForImplicitFlow,
  .accessTokenLifespanForWebApps, .accessTokenLifespan, .offlineSessionIdleTimeout,
  .accessTokenLifespanInSeconds, .ssoSessionIdleTimeout, .ssoSessionMaxLifespan,
  .ssoSessionIdleTimeoutRememberMe, .ssoSessionMaxLifespanRememberMe,
  .accessCodeLifespan, .accessCodeLifespanLogin, .accessCodeLifespanUserAction,
  .accessCodeLifespanMobile, .notBefore, .registrationAllowed,
  .registrationEmailAsUsername, .rememberMe, .verifyEmail, .resetPasswordFlow,
  .editUsernameAllowed, .bruteForceProtected, .permanentLockout, .maxFailureWaitSeconds,
  .minimumQuickLoginWaitSeconds, .waitIncrementSeconds, .quickLoginCheckMilliSeconds,
  .maxDeltaTimeSeconds, .failureFactor, .requiredCredentials, .otpPolicyType,
  .otpPolicyAlgorithm, .otpPolicyInitialCounter, .otpPolicyDigits, .otpPolicyLookAheadWindow,
  .otpPolicyPeriod, .otpSupportedApplications, .webAuthnPolicyRpEntityName,
  .webAuthnPolicyAttestationConveyancePreference, .webAuthnPolicyAuthenticatorAttachment,
  .webAuthnPolicyRequireResidentKey, .webAuthnPolicyUserVerificationRequirement,
  .webAuthnPolicyCreateTimeout, .webAuthnPolicyAssertionTimeout,
  .webAuthnPolicyRegistrationRecoveryEnabled, .webAuthnPolicyRegistrationRecoveryCodesQuantity,
  .webAuthnPolicyRegistrationTokenBindingRequired, .webAuthnPolicyRegistrationAttestationConveyancePreference,
  .webAuthnPolicyRegistrationAuthenticatorSelectionCriteria, .keys
) 
| walk(if type == "object" then del(.id) else . end)' < "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Minimal export saved to $OUTPUT_FILE"
