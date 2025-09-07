<h1 align="center">
jarr
</h1>

<p align="center">
	<a href="https://github.com/wenzzzel/jarr/stargazers"><img src="https://img.shields.io/github/stars/wenzzzel/jarr?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
	<a href="https://github.com/wenzzzel/jarr/issues"><img src="https://img.shields.io/github/issues/wenzzzel/jarr?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
	<a href="https://github.com/wenzzzel/jarr/contributors"><img src="https://img.shields.io/github/contributors/wenzzzel/jarr?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>
<p align="center">
    <img src="Assets/logo.jpeg" style="width: 500px; height: auto; border-radius:10px"/>
</p>

## ℹ️ About
Uploads arr backups to an sftp server on a schedule

## 🏃‍➡️ How to run
Mandatory environment variables:
 - RADARR_API_KEY
 - SONARR_API_KEY
 - PROWLARR_API_KEY
 - BAZARR_API_KEY
 - SFTP_SERVER
 - SFTP_USERNAME
 - SFTP_PASSWORD

*Note: No api key needed for Tdarr*

Mandatory volumes to mount:
 - /radarrConfig
 - /sonarrConfig
 - /prowlarrConfig
 - /bazarrConfig
 - /tdarrConfig
 - /qbittorrentConfig

*Note: The volumes should point to the root of the config directory for each arr app*

## 🐋 Docker image
wenzzzel/jarr on [docker hub](https://hub.docker.com/repository/docker/wenzzzel/jarr/general)