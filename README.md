# flexibee-client - deb balíček

![FlexiBee client logo](https://raw.githubusercontent.com/Vitexus/flexibee-client-deb/master/flexibee-client.png)

[EN] Debian Package for client-only deploy of czech accounting system FlexiBee

Instalace
---------

Pro Debian 10 použijte [repozitář](http://repo.vitexsoftware.cz/):

```shell
echo "deb http://repo.vitexsoftware.cz $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/vitexsoftware.list
sudo wget -O /etc/apt/trusted.gpg.d/vitexsoftware.gpg http://repo.vitexsoftware.cz/keyring.gpg
sudo apt update
sudo apt install flexibee-client
```

![Installation](https://raw.githubusercontent.com/Vitexus/flexibee-client-deb/buster/installation.png)

Vývojáři uživatelských reportů  mohou povolit aktualizace projektů JasperStudia 

![Configuration](https://raw.githubusercontent.com/Vitexus/flexibee-client-deb/buster/configuring.png)

Compatibility classes Added:
---------------------------

 * jaxb-api-2.3.0.jar
 * javax.annotation-api-1.3.2.jar

Pokud pracujete s více firmami které se vám pletou zvažte instalaci [temného klienta](https://github.com/VitexSoftware/dark-flexibee-client-deb)
