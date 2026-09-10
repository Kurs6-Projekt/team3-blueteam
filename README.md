Statusuppdatering team 3:

Klart:
- WIF i drift, gamla SA-nyckeln borttagen ur kod, state, GCP och GitHub-secrets
- Tre nya brandväggsregler med loggning: IAP (35.235.240.0/20), internt subnät, instruktörsnätet
- iap.googleapis.com aktiverat
- Deploy-pipelinen grön igen (PR #25)

Blockerat:
- Tunnelrollen roles/iap.tunnelResourceAccessor saknas. Instansnivå kräver iap.policyAdmin som vi inte har (403). Projektnivå funkar men rör IAM i det delade projektet, så vi frågar instruktören först. Se issue #26.
- Därför står allow_traffic (0.0.0.0/0, alla protokoll) kvar tills IAP fungerar.

Applicera inte bootstrap utan att säga till i kanalen.

Nästa fynd att ta: plan saknas i PR-checken (#9), och deploy.yml applicerar automatiskt utan godkännande.
