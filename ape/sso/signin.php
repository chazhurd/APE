<?php
/**
 * Sign in with EWU SSO
 * @author Team APE 2013-2014, Tu Nguyen 2017
 * @version 1.0
 */

include_once __DIR__ . '/../../vendor/autoload.php';

$client = new Google_Client();
$client->setAuthConfig(__DIR__ . '/../../client_secret.json');
$client->addScope('openid profile email');
$client->setRedirectUri('http://localhost:8080/ape/view/home');

// offline access will give you both an access and refresh token so that
// your app can refresh the access token without user interaction.
$client->setAccessType('offline');

// Using "consent" ensures that your application always receives a refresh token.
// If you are not using offline access, you can omit this.
// $client->setApprovalPrompt("consent");
$client->setPrompt('consent');
$client->setIncludeGrantedScopes(true);   // incremental auth

$auth_url = $client->createAuthUrl();

$_SESSION['loggedIn'] = true;
header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));
?>
