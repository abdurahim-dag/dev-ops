{{/*
The name of the chart.
*/}}
{{- define "momo-store-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "momo-store-chart.version" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
 
{{/*
Selector labels
*/}}
{{- define "momo-store-chart.selectorLabels" -}}
app: {{ include "momo-store-chart.name" . }}
app.kubernetes.io/name: {{ include "momo-store-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
  
{{/*
Common labels
*/}}
{{- define "momo-store-chart.labels" -}}
helm.sh/chart: {{ include "momo-store-chart.version" . }}
{{ include "momo-store-chart.selectorLabels" . }}
app.kubernetes.io/version: {{ default .Chart.AppVersion .Values.AppVersion }}
app.kubernetes.io/part-of: momo-store
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
  
