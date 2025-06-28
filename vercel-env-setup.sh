#!/bin/bash

echo "🚀 Configuration des variables d'environnement Vercel pour HebergTonServ (VERSION GRATUITE)"
echo "==================================================================================="

# Vérifier si Vercel CLI est installé
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI n'est pas installé. Installation..."
    npm i -g vercel
fi

# Se connecter à Vercel
echo "🔐 Connexion à Vercel..."
vercel login

# Lier le projet
echo "🔗 Liaison du projet..."
vercel link

echo "⚙️  Configuration des variables d'environnement (max 12 pour le plan gratuit)..."

# Variables WHMCS Core (essentielles)
echo "📋 Variables WHMCS Core..."
vercel env add WHMCS_URL production
vercel env add WHMCS_API_IDENTIFIER production
vercel env add WHMCS_API_SECRET production

# Configuration Next.js (essentielles)
echo "⚡ Variables Next.js..."
vercel env add NEXTAUTH_URL production
vercel env add NEXTAUTH_SECRET production

# Configuration de sécurité (essentielles)
echo "🔐 Variables Sécurité..."
vercel env add JWT_SECRET production
vercel env add ENCRYPTION_KEY production

# Configuration minimale d'Email (essentielle)
echo "📧 Variables Email minimales..."
vercel env add SMTP_HOST production
vercel env add SMTP_USER production
vercel env add SMTP_PASSWORD production

# Configuration de l'environnement (essentielles)
echo "🌍 Variables Environnement..."
vercel env add NODE_ENV production
vercel env add NEXT_PUBLIC_APP_URL production

echo ""
echo "✅ Configuration terminée pour le plan GRATUIT!"
echo ""
echo "📋 Variables configurées (Total: 12 variables - limite du plan gratuit):"
echo "✓ WHMCS Core (3 variables)"
echo "✓ Next.js Auth (2 variables)"
echo "✓ Sécurité (2 variables)"
echo "✓ Email minimales (3 variables)"
echo "✓ Environnement (2 variables)"
echo ""
echo "🚀 Prochaines étapes:"
echo "1. Exécutez ce script: chmod +x vercel-env-setup.sh && ./vercel-env-setup.sh"
echo "2. Testez le déploiement avec: vercel --prod"
echo "3. Vérifiez les variables dans: vercel env ls"
echo ""
echo "⚠️  LIMITATIONS DU PLAN GRATUIT À CONSIDÉRER:"
echo "- Maximum 12 variables d'environnement (respecté dans ce script)"
echo "- Temps d'exécution des fonctions limité à 10 secondes"
echo "- Pas de jobs cron (supprimer les tâches cron dans vercel.json)"
echo "- Pas de sélection de région spécifique (supprimer 'regions' dans vercel.json)"
echo "- Pas de base de données Vercel Postgres ou Redis KV (utiliser des alternatives)"
echo ""
echo "⚠️  Fonctionnalités supprimées par rapport au script original:"
echo "- Base de données WHMCS avancée"
echo "- Plusieurs variables SMTP"
echo "- Services Analytics avancés"
echo "- IA/Analyse de sentiment"
echo "- Intégration des paiements"
echo "- Monitoring avancé (Sentry)"
echo "- Bases de données externes"
echo "- Stockage Cloud"
echo "- Chat/Support"
echo "- Webhooks de notification"
echo ""
echo "💡 CONSEIL: Modifiez également votre fichier vercel.json pour:"
echo "1. Réduire 'maxDuration' à 10 secondes"
echo "2. Supprimer la section 'regions'"
echo "3. Supprimer la section 'crons'"