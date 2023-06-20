#!/bin/bash

source $HOME/.gnuhealthrc

LANGUAGE="zh_CN"
TRYTON_DATABASE="translations"
TRYTON_SERVER_DIR=${GNUHEALTH_DIR}/tryton/server

cd $HOME/projects/health/tryton
cp --parents health/health.py \
   health_genetics/health_genetics.py \
   health_lifestyle/health_lifestyle.py \
   health_nursing/health_nursing.py \
   health_pediatrics/health_pediatrics.py \
   health_socioeconomics/health_socioeconomics.py \
   health_surgery/health_surgery.py \
   $HOME/gnuhealth/tryton/server/modules/

cd $HOME/projects/gnuhealth-reports/

cp -r tryton/* $HOME/gnuhealth/tryton/server/modules/

echo "## 正在升级 gnuhealth 所有模块 ..." 
${TRYTON_SERVER_DIR}/trytond-${TRYTON_VERSION}/bin/trytond-admin --email admin -d ${TRYTON_DATABASE} --all
