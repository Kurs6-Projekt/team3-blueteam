# OS Login för jumphosten

Jumphosten använder GCP OS Login. Varje medlem ansluter med sin egen Google-
identitet och sin egen SSH-nyckel.

> De gamla SSH-nycklarna i instansmetadata städas **inte** bort ännu. De tas
> bort först när hela teamet har verifierat sin OS Login-åtkomst.

## Behörighet

Innan du kan ansluta måste en administratör lägga till din Chas-adress i
Terraform och tillämpa ändringen:

- `os_login_users` ger SSH-åtkomst utan `sudo`.
- `os_admin_users` ger SSH-åtkomst med `sudo`. Bara Dennis ska ligga här.

## Förbered din nyckel

Logga in i Google Cloud och ladda upp din publika nyckel. Skapa först en ny
nyckel med `ssh-keygen -t ed25519` om `~/.ssh/id_ed25519.pub` saknas.

```bash
gcloud auth login
gcloud config set project itsx25-lab
gcloud compute os-login ssh-keys add --key-file=~/.ssh/id_ed25519.pub
```

Hämta ditt OS Login-användarnamn:

```bash
gcloud compute os-login describe-profile \
  --format='value(posixAccounts[0].username)'
```

Ett konto som `andre.edvardsson@chasacademy.se` blir normalt
`andre_edvardsson_chasacademy_se`.

## Anslut

Använd ditt OS Login-användarnamn i stället för ditt gamla Linux-namn:

```bash
ssh -i ~/.ssh/id_ed25519 OS_LOGIN_ANVANDARE@34.51.254.89
```

För Firefox SOCKS-proxy använder du samma användarnamn och lämnar terminalen
öppen:

```bash
ssh -N -D 127.0.0.1:1080 \
  -i ~/.ssh/id_ed25519 \
  OS_LOGIN_ANVANDARE@34.51.254.89
```

Ställ in Firefox på SOCKS v5, värd `127.0.0.1`, port `1080`, och aktivera
proxy-DNS via SOCKS v5.

## Felsökning

`Permission denied (publickey)` betyder oftast att nyckeln inte är uppladdad
till OS Login eller att din e-postadress saknar en av OS Login-rollerna.
Kontakta teamet med din Chas-adress; dela aldrig privata SSH-nycklar eller
lösenord.
