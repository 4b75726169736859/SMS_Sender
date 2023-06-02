# !!! Un message par proxy et par numero !!!
# Tester sur Windows 11
# Chemin du fichier contenant la liste de proxys (un proxy par ligne, format : proxy:port:user:password)
$proxyFile = ""

# URL cible
$url = "https://textbelt.com/text"

# Num�ro de t�l�phone et message
$phone = ""
$message = ""

# Lecture du fichier de proxys
$proxyList = Get-Content $proxyFile

# Boucle sur chaque proxy dans le fichier
foreach ($proxy in $proxyList) {
    # Extraction des informations du proxy
    $proxyIP = $proxy.Split(":")[0]
    $proxyPort = $proxy.Split(":")[1]
    $proxyUser = $proxy.Split(":")[2]
    $proxyPassword = $proxy.Split(":")[3]

    # Configuration des param�tres de proxy syst�me
    [System.Net.WebRequest]::DefaultWebProxy = New-Object System.Net.WebProxy($proxyIP, $proxyPort)
    [System.Net.WebRequest]::DefaultWebProxy.Credentials = New-Object System.Net.NetworkCredential($proxyUser, $proxyPassword)

    # Ex�cution de la requ�te web
    $response = Invoke-WebRequest -Uri $url -Method POST -Body @{
        phone = $phone
        message = $message
        key = "textbelt"
    }

    # Affichage du r�sultat
    $response.Content
}
