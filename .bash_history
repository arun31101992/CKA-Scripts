kubectl get jobs
history | grep -i export
export KUBECONFIG=/etc/kubernetes/admin.conf
history | grep -i export
kubectl get jobs
kubectl create jobs --help
kubectl create job my-job --image=busybox
kubectl get jobs
kubectl describe job my-job
vi job_fibonacci.yaml
kubectl apply -f job_fibonacci.yaml 
kubectl get jobs
kubectl delete job my-job
kubectl get jobs
kubectl describe job fibonacci
kubectl get pods
kubectl logs fibonacci-jcjtp
kubectl delete job fibonacci
kubectl get job
vi job_fibonacci.yaml 
kubectl apply -f job_fibonacci.yaml 
kubectl get pods
kubectl get jobs
kubectl describe pod fibonacci-9j58r
kubectl get jobs
kubectl describe job fibonacci
kubectl get pods
kubectl delete job fibonacci
kubectl get jobs
kubectl get pods
vi job_fibonacci.yaml 
kubectl apply -f job_fibonacci.yaml 
kubectl get pods
kubectl logs fibonacci-2ttwn
kubectl logs fibonacci-jlzfr
kubectl get jobs
kubectl describe job fibonacci
kubectl delete job fibonacci
kubectl get jobs
kubectl get pods
vi cronjob.yaml
cp job_fibonacci.yaml cronjob.yaml
vi cronjob.yaml 
kubectl apply -f cronjob.yaml 
vi cronjob.yaml 
kubectl apply -f cronjob.yaml 
vi cronjob.yaml 
kubectl apply -f cronjob.yaml 
vi cronjob.yaml 
kubectl apply -f cronjob.yaml 
kubectl get jobs
kubectl get pods
kubectl get jobs
vi cronjob.yaml 
kubectl get jobs
kubectl get cronjobs
kubectl get jobs
kubectl get pods
kubectl get jobs -w
kubectl get pods
kubectl logs pi-cron-1593369480-hbbgs
kubectl get jobs -w
kubectl delete cronjobs pi-cron
kubectl get jobs -w
kubectl get jobs
kubectl get pods
kubectl get cronjobs
vi deamonset.yaml
kubectl apply -f dea
kubectl apply -f deamonset.yaml 
kubectl get daemonsets
kubectl describe daemonsets tomcat-daemon
kubectl get pods
kubectl logs tomcat-daemon-xvlmw
kubectl describe pod tomcat-daemon-xvlmw
kubectl get daemonsets
kubectl edit daemonset tomcat-daemon
kubectl get daemonsets
kubectl edit daemonset tomcat-daemon
kubectl get daemonsets
kubectl get pods
kubectl get pods -0 wide
kubectl get pods -o wide
kubectl get daemonsets
kubectl delete daemonset tomcat-daemon
kubectl get daemonsets
kubectl get pods -o wide
cp ubuntu_deployment.yaml ubuntu_deployment_emptydir.yaml 
vi ubuntu_deployment_emptydir.yaml 
kubectl apply -f ubuntu_deployment_emptydir.yaml 
kubectl get deployments
kubectl describe deployments ubuntu-deployment
kubectl get pods
kubectl exec -it ubuntu-deployment-7768467774-cb25n sh
kubectl delete ubuntu-deployment-7768467774-cb25n
kubectl get pods
kubectl delete pod ubuntu-deployment-7768467774-cb25n
kubectl get pods
kubectl exec -it ubuntu-deployment-7768467774-8k9zk sh
kubectl delete deployment ubuntu-deployment
kubectl get pods
kubectl get rs
kubectl get deployments
kubectl get pods
vi ubuntu_deployment
vi ubuntu_deployment_emptydir.yaml 
kubectl apply -f ubuntu_deployment_emptydir.yaml 
kubectl get deployments
kubectl describe deployments ubuntu-deployment
kubectl get pods
kubectl exec -it ubuntu-deployment-f7bc6bdff-mlh9s sh
kubectl delete pod ubuntu-deployment-f7bc6bdff-mlh9s
kubectl get pods
kubectl exec -it ubuntu-deployment-f7bc6bdff-4sxkl sh
kubectl get pods -o wide
kubectl exec -it ubuntu-deployment-f7bc6bdff-4sxkl sh
kubectl get pods -o wide
kubectl exec -it ubuntu-deployment-f7bc6bdff-4sxkl sh
kubectl delete deployment ubuntu-deployment
ll
kubectl get deployments
kubectl get rs
kubectl get pods
vi ubuntu_deployment_pv_hostpathvol.yaml
history
kubectl apply -f ubuntu_deployment_pv_hostpathvol.yaml 
kubectl get pv
kubectl describe pv testpv
kubectl get pvc
kubectl describe pvc testpvc
kubectl get deployments
kubectl describe deployments ubuntu-deplyment
kubectl describe deployments ubuntu-deployment
kubectl get pods
kubectl get pods -o wide
kubectl exec -it ubuntu-deployment-7cbf56cbb-jg8xc sh
kubectl get pv
kubectl get pvc
kubectl delete deployment ubuntu-_deployment
kubectl get deployments
kubectl delete deployment ubuntu-deployment
kubectl get deployments
kubectl get pvc
kubectl delete pvc testpvc
kubectl get pv
kubectl get pvc
kubectl get deployments
kubectl get rs
kubectl get pods
kubectl get jobs
kubectl get cronjobs
kubectl get rc
kubectl get svc
ll
vi ubuntu_deployment_pv_hostpathvol_updated.yaml
kubectl apply -f apiVersion: v1
kind: PersistentVolume
metadata:
  name: testpv
  labels:
    env: staging
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  storageClassName: whizlabs
  persistentVolumeReclaimPolicy: Delete
  hostPath:
    path: /tmp/pvcdir
    type: DirectoryOrCreate
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: testpvc
  namespace: whizspace
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: whizlabs
  selector:
    matchLabels:
      env: staging
  resources:
    requests:
      storage: 1Gi
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ubuntu-deployment
  namespace: whizspace
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ubuntu
  template:
    metadata:
      labels:
        app: ubuntu
    spec:
      containers:
      - name: ubuntu-container
        image: ubuntu
        command: ["/bin/sh"]
        args:
        - "-c"
        - "echo the pod is running; while true; do echo .; sleep 1; done"
        volumeMounts:
        - name: ubuntu-pvc-storage
          mountPath: /tmp/data
      volumes:
      - name: ubuntu-pvc-storage
        persistentVolumeClaim:
          claimName: testpvc
ll
kubectl apply -f ubuntu_deployment_pv_hostpathvol_updated.yaml
kubectl get pv
kubectl get pvc
kubectl delete deplyment ubuntu-deployment
kubectl delete deployment ubuntu-deployment
kubectl delete pv testpv
kubectl delete pvc testpvc
kubectl delete pv testpv
kubectl get pvc
kubectl get pv
kubectl get deployments
vi ubuntu_deployment_pv_hostpathvol_updated.yaml 
kubectl apply -f ubuntu_deployment_pv_hostpathvol_updated.yaml 
kubectl get pv
kubectl get pvc
kubectl describe pvc testpvc
kubectl delete deployment/ubuntu-deployment pv/testpv pvc/testpvc
vi ubuntu_deployment_pv_hostpathvol_updated.yaml 
kubectl apply -f ubuntu_deployment_pv_hostpathvol_updated.yaml 
kubectl get pvc
kubectl get pv
kubectl describe pvc testpvc
kubectl describe pv testpv
cat ubuntu_deployment_pv_hostpathvol_updated.yaml 
kubectl delete deployment/ubuntu-deployment pvc/testpvc
kubectl get pv
kubectl get pvc
kubectl get deployments
vi gcpStorageClass.yml
kubectl apply -f gcpStorageClass.yml 
kubectl get storageclass
kubectl describe sc gcp-storageclass
kubectl get deployments
kubectl get rs
kubectl get rc
kubectl get storageclas
kubectl get storageclass
kubectl delete storageclass gcp-storageclass
kubectl get storageclass
kubectl get secrets --all-namespaces
kubectl create secret --help
kubectl create secret generic dev-db-secret --from-literal=username=devuser --from-literal=password='$!dfeer$'
kubectl get secrets
kubectl describe secret dev-db-secret
kubectl get secrets --all-namespaces
vi opaqueSecret.yaml
cat opaqueSecret.yaml 
echo -n 'admin' | base64
kubectl apply -f opaqueSecret.yaml 
kubectl get secrets
kubectl describe secret mysecret
vi ubuntu_deployment_secret_env.yaml
kubectl get pods
kubectl apply -f ubuntu_deployment_secret_env.yaml 
kubectl get pods
kubectl exec ubuntu-deployment-64fcb78fdb-hxz45 -- printenv
kubectl delete deployment ubuntu-deployment
kubectl get pods
kubectl get secrets
vi ubuntu_deployment_secret_vol_file.yaml 
kubectl apply -f ubuntu_deployment_secret_vol_file.yaml 
kubectl get secrets
kubectl get pods
kubectl exec -it ubuntu-deployment-5b4cb8d74f-fcvxm sh
kubectl delete deployment ubuntu-deployment
kubectl get pods
kubectl create configmap --help
kubectl create cm my-config --from-literal=key1=config1 --from-literal=key2=config2
kubectl get cm
kubectl describe cm my-config
kubectl get cm --all-namespaces
kubectl describe cm coredns
kubectl describe cm coredns -n kube-system
history
cat key.txt
vi key.txt
cat key.txt
kubectl create configmap cm-file --from-file=key.txt
kubectl get cm
kubectl describe cm-file
kubectl describe cm cm-file
vi configMap.yml
kubectl apply -f configMap.yml 
kubectl get cm
kubectl describe cm cm-example
cat configMap.yml 
vi ubuntu_deployment_configmap_env.yaml
ll
cp ubuntu_deployment_secret_env.yaml 
cp ubuntu_deployment_secret_env.yaml ubuntu_deployment_configmap_env.yaml
vi ubuntu_deployment_configmap_env.yaml
cat ubuntu_deployment_configmap_env.yaml 
kubectl apply -f ubuntu_deployment_configmap_env.yaml 
vi ubuntu_deployment_configmap_env.yaml
kubectl apply -f ubuntu_deployment_configmap_env.yaml 
kubectl get cm
kubectl get pods
kubectl exec ubuntu-deployment-5f56c74b96-kvr69 -- printenv
kubectl delete deployment ubuntu-deployment
kubectl get pods
vi ubuntu_deployment_configmap_vol.yaml
kubectl get cm
history
kubectl get cm
ll
kubectl apply -f ubuntu_deployment_configmap_vol.yaml
kubectl get pods
ll
kubectl get pods
kubectl exec -it ubuntu-deployment-6d595d795b-l9nmh bash
kubectl delete deployment ubuntu-deployment
kubectl get pods
kubectl get deployments
kubectl get rs
kubectl get rc
kubectl get svc
kubectl get cm
kubectl delete cm cm-example
kubectl delete cm cm-file
kubectl delete cm my-config
kubectl get cm
kubectl get secrets
kubectl delete secret dev-db-secret
kubectl delete secret mysecret
kubectl get secrets
kubectl get cm
kubectl get secrets
kubectl get pods
exit
history | grep -i export
export KUBECONFIG=/etc/kubernetes/admin.conf
vi nginx_deployment.yaml 
kubectl apply -f nginx_deployment
kubectl apply -f nginx_deployment.yaml 
kubectl describe deployment nginx-deployment
kubectl set image deployment nginx-deployment nginx=nginx:1.33
kubectl describe deployment nginx-deployment
kubectl get pods
kubectl describe pod nginx-deployment-79896ddf67-4gjqn
kubectl rollout status deployment nginx-deployment
kubectl rollout undo deployment nginx-deployment
kubectl describe deployment nginx-deployment
kubectl get pods
kubectl edit nginx-deployment
kubectl edit deployment  nginx-deployment
kubectl describe deployment nginx-deployment
kubectl set image deployment nginx-deployment nginx=nginx:1.33
kubectl describe deployment nginx-deployment
kubectl get pods
kubectl describe deployment nginx-deployment
kubectl edit deployment nginx-deployment
kubectl set image deployment nginx-deployment nginx=nginx
kubectl describe deployment nginx-deployment
kubectl get pods
kubectl describe deployment nginx-deployment
kubectl set image deployment nginx-deployment nginx=nginx:1.33
kubectl describe deployment nginx-deployment
kubect rollout undo deployment nginx-deployment
kubectl rollout undo deployment nginx-deployment
kubectl describe deployment nginx-deployment
kubectl edit deployment nginx-deployment
kubectl delete deployment nginx-deployment
kubectl describe deployment nginx-deployment
kubectl get deployments
kubectl get pods
kubectl get rs
ll
vi ubuntu_deployment_pvc.yaml
cat ubuntu_deployment_pv_hostpathvol.yaml
vi persistentVolume.yaml
ll
cat ubuntu_deployment_pvc.yaml 
vi ubuntu_deployment_pvc.yaml 
vi persistentVolume.yaml
kubectl apply -f persistentVolume.yaml 
kubectl apply -f ubuntu_deployment_pvc.yaml 
kubectl get deployments
kubectl get pvc
kubectl get pods -o wid
kubectl get pods -o wide
kubectl exec -it ubuntu-deployment-7cbf56cbb-cptd8 sh
kubectl get pv
kubectl exec -it ubuntu-deployment-7cbf56cbb-q47lw sh
kubectl delete deployment ubuntu-deployment
kubectl get deployments
kubectl get pvc
kubectl delete pvc
kubectl delete pvc testpvc
kubectl delete pv
kubectl get pv
ll
vi nginx_statefulset.yaml 
vi nginx_statefulset_pvc.yaml 
kubectl apply -f nginx_statefulset_pvc.yaml 
kubectl get ss
kubectl get sttefulsets
kubectl get svc
kubectl get statefulsets
kubectl describe statefulsets
kubectl get pv
vi nginx_statefulset_pvc.yaml 
kubectl get pods
kubectl get pods -o wide
kubectl describe pod web-0
kubectl delete statefulsets web-0
kubectl delete statefulsets web
kubectl get statefulsets
kubectl get pods -o wide
kubectl get pv
kubectl delete pv testpv1 testpv2 testpv4 testpv5
kubectl get pv
vi persistentVolume.yaml 
kubectl apply -f persistentVolume.yaml 
kubectl get pv
kubectl apply -f nginx_statefulset_pvc.yaml 
kubectl get svc
kubectl get statefulsets
kubectl describe statefulsets web
kubectl get pods
kubectl get pv
kubectl get pvc
kubectl delete statefulsets web
kubectl get pvc
kubectl get statefulsets
kubectl get pvc
kubectl delete pvc www-web-0 www-web-1 www-web-2
kubectl get pv
kubectl delete pv testpv4 testpv5
kubectl get svc
kubectl delete svc nginx
kubectl get pod
kubectl get pods
kubectl apply -f persistentVolume.yaml 
vi nginx_statefulset_OnDelete.yaml
kubectl apply -f nginx_statefulset_OnDelete.yaml 
kubectl get svc
kubectl get statefulsets
kubectl describe statefulsets
kubectl get pods
kubectl get pvc
kubectl get pv
kubectl set image statefulset web nginx=nginx:1.16-perl
kubectl describe statefulsets
kubectl get pods
kubectl describe pod web-0
kubectl delete pod web-1
kubectl get pods
kubectl describe pod web-1
kubectl delete statefulset web
kubectl get pods
kubectl get statefulsets
kubectl get svc
kubectl delete svc nginx
kubectl get pvc
kubectl delete pvc www-web-0 www-web-1 www-web-2
kubectl get pv
kubectl delete pv testpv4 testpv5
ll
kubectl get pv
kubectl apply -f persistentVolume.yaml 
vi nginx_statefulset_rollingupdatepartition.yaml
kubectl apply -f nginx_statefulset_rollingupdatepartition.yaml 
kubectl get statefulsets
kubectl describe statefulsets
kubectl get pvc
kubectl get pv
kubectl get pods
kubectl describe pod web-0
kubectl set image statefulset web nginx=nginx:1.16-perl
kubectl get pods
kubectl describe pod web-3
kubectl describe pod web-4
kubectl describe pod web-2
kubectl describe pod web-1
kubectl describe pod web-0
kubectl delete statefulset web
kubectl get statefulset
kubectl get pods
kubectl get svc
kubectl delete svc nginx
kubectl get svc
kubectl get pvc
kubectl delete pvc www-web-0 www-web-1 www-web-2 www-web-3 www-web-4
kubectl get pvc
kubectl get pv
kubectl get deployments
kubectl get rs
kubectl get rc
kubectl get secrets
kubectl get configmap
exit
history | grep -i export
export KUBECONFIG=/etc/kubernetes/admin.conf
ll
kubectl get priorityclass
kubectl get priorityclass -o wide
vi whizPriorityClass.yaml
kubectl apply -f whizPriorityClass.yaml 
kubectl get priorityclass
kubectl describe high-priority
kubectl describe pc high-priority
kubectl describe pc system-critical-cluster
kubectl describe pc system-cluster-critical
kubectl describe pc system-node-critical
vi nginx_priority.yaml
kubectl apply -f nginx_priority.yaml 
kubectl get pods
kubectl describe pod nginx-deployment-6cfb5f4d8c-fjcxh
vi resourceQuota_compute.yaml
kubectl delete nginx-deployment
kubectl get deployments
kubectl delete deployment nginx-deployment
kubectl get pods
kubectl get rs
history
cat nginx_priority.yaml 
ll
cat resourceQuota_compute.yaml 
kubectl apply -f resourceQuota_compute.yaml 
kubectl get quoa
kubectl get quota
kubectl describe quota compute-resources
vi nginx_deployment_limits.yaml
kubectl apply -f nginx_deployment_limits.yaml 
kubectl get pods
kubectl describe pod nginx-deployment-5c475978cf-2ckvp
kubectl descibe quota
kubectl get quota
kubectl descibe quota compute-resources
kubectl describe quota compute-resources
kubectl delete deployment nginx-deployment
kubectl get quota
kubectl describe quota compute-resources
kubectl get pods
kubectl get deployments
kubectl get ps
kubectl get pc
kubectl delete pc high-priority
kubectl get pc
kubectl get quota
kubectl get storageclass
ll
history
ll
cat ubuntu_deployment_configmap_vol.yaml
ll
cat nginx_statefulset.yaml
ll
vi resourceQuota_storagee.yaml 
kubectl get storageclass
history
history | grep -i storagecla
ll
cat gcpStorageClass.yml 
kubectl apply -f gcpStorageClass.yml 
kubectl get storageclass
ll
kubectl apply -f resourceQuota_storagee.yaml 
kubectl get quota
cat resourceQuota_storagee.yaml 
kubectl describe quota storage-resources
cat ubuntu_deployment_pvc.yaml 
kubectl get pvc
kubectl get pv
kubectl apply -f ubuntu_deployment_pvc.yaml 
kubectl get quota
kubectl describe quota storage-resources
kubectl get sc
kubectl delete sc gcp-storageclass
kubectl delete deployment ubuntu-deployment
kubectl get pods
kubectl get pvc
kubectl get pv
kubectl delete pvc testpvc
kubectl get pvc
kubectl get pv
kubectl get sc
kubectl get quota
vi resourceQuota_coreobjects.yaml
kubectl apply -f resourceQuota_coreobjects.yaml 
kubectl get quota
kubectl describe quota core-object-counts
vi limitRange.yaml
kubectl apply -f limitRange.yaml 
kubectl get lr
kubectl get limitrange
kubectl describe limitrange limit-compute
cat limitRange.yaml 
vi ubuntu_deployment_pvc.yaml 
kubectl describe quota compute-cluster
kubectl get quota
kubectl describe quota compute-resources
kubectl apply -f ubuntu_deployment_pvc.yaml 
kubectl get pods
kubectl describe pod ubuntu-deployment-7cbf56cbb-r8dzr
kubectl describe quota compute-resources
kubectl delete deployment ubuntu-deployment
kubectl get limitRange.yaml 
kubectl get limitRange
kubectl delete limitrange limit-compute
kubectl get limitRange
kubectl get quota
kubectl delete quota compute-resources storage-resources core-object-counts
kubectl get quota
kubectl get limitRange
kubectl get pc
kubectl get pvc
kubectl delete pvc testpvc
kubectl get pvc
kubectl get pv
kubectl get deployments
kubectl get pods
kubectl get svc
kubectl get rs
kubectl get rc
kubectl get secret
kubectl get configmap
vi horizontalpod_Autoscaler.yaml
kubectl apply -f horizontalpod_Autoscaler.yaml 
kubectl get hpa
kubectl describe hpa custom
vi xyz_deployment.yaml
kubectl apply -f xyz_deployment.yaml 
kubectl get hpa
kubectl describe hpa custom
ll
cat nginx_deployment.yaml 
kubectl apply -f nginx_deployment.yaml 
history | grep -i export
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f nginx_deployment.yaml 
kubectl get deployments
kubectl autoscale deployment.apps/nginx-deployment --min=2 --max=5 --cpu-percent=80
kubectl get hpa -o wide
kubectl describe hpa nginx-deployment
kubectl get hpa -o wide
cat nginx_deployment.yaml 
kubectl get hpa
kubectl get deployments
kubectl delete deployment nginx-deployment xyz-deployment
kubectl get deployments
kubectl get pods
kubectl get svc
kubectl get pvc
kubectl get pv
kubectl get hpa
kubectl delete hpa custom
kubectl delete hpa nginx-deployment
kubectl get hpa
exit
ll
vi busybox_deployment_livenessprobe.yaml
kubectl apply -f busybox_deployment_livenessprobe.yaml 
history | grep -i export
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f busybox_deployment_livenessprobe.yaml 
kubectl get deployment
kubectl get pods
kubectl logs busybox-deployment-5844486746-vlmh7
kubectl describe pod busybox-deployment-5844486746-vlmh7
kubectl delete deployment busybox-deployment
kubectl get pods
kubectl get deployment
kubectl get pods
vi mysql_deployment_readinessprobe.yaml 
kubectl apply -f mysql_deployment_readinessprobe.yaml 
kubectl get deployment
kubectl get pods
kubectl describe pod mysql-ff4f5cf55-vhjkz
kubectl get pods
kubectl logs mysql-ff4f5cf55-vhjkz
kubectl describe pod mysql-ff4f5cf55-vhjkz
kubectl get deployment
kubectl delete deployment mysql
kubectl get pods
kubectl get pv
kubectl get pvc
kubectl delete pvc my-sql-pv-claim
kubectl delete pvc mysql-pv-claim
kubectl get pvc
kubectl get pv
kubectl delete pv mysql-pv-volume'
kubectl delete pv mysql-pv-volume
kubectl get svc
kubectl delete svc mysql-svc
kubectl get svc
kubectl get pvc
kubectl get pv
kubectl get deployments
kubectl get pods
systemctl status systemd-journald
ls -l /run/log/journal/
ll
vi ubuntu_busybox_deployment.yaml
cat ubuntu_deployment.yaml 
cp ubuntu_deployment.yaml ubuntu_busybox_deployment.yaml 
vi ubuntu_busybox_deployment.yaml 
kubectl apply -f ubuntu_busybox_deployment.yaml 
cat ubuntu_busybox_deployment.yaml 
vi ubuntu_busybox_deployment.yaml 
kubectl apply -f ubuntu_busybox_deployment.yaml 
kubectl get pods
kubectl logs ubuntu-deployment-8448cb8cb5-rsrsp
kubectl logs ubuntu-deployment-8448cb8cb5-rsrsp -c ubuntu-container
kubectl logs ubuntu-deployment-8448cb8cb5-rsrsp -c busybox-container
docker info | grep -i "Logging Driver"
ll
vi ubuntu_busybox_deployment.yaml 
kubectl get deployment
kubectl delete deployment ubuntu-deployment
kubectl get deployment
kubectl get pods
kubectl get pods --all-namespaces
mkdir metrics
cd metrics/
ll
git clone https://github.com/kubernetes-sigs/metrics-server.git
yum install -y git
git clone https://github.com/kubernetes-sigs/metrics-server.git
ll
cd metrics-server/
kubectl create -f deploy/kubernetes/
ll
cd ../
ll
rm -rf metrics/
ll
kubectl get pods
kubectl get deployments
kubectl get statefulsets
kubectl get rs
kubectl get rc
kubectl get pv
kubectl get pvc
kubectl get secrets
kubectl get configmap
kubectl get svc
ll
cat nginx_statefulset.yaml 
kubectl get events
kubectl get nodes
kubectl get nodes kube-worker-flannel -o yaml
journalctl --unit kubelet
ps auwx | grep -i kube-proxy
ps aux | grep -i kube-proxy
kubectl get nodes
kubectl get svc
cat busybox_deployment.yaml
ll
vi pod-disruption-budget.yaml
cat pod-disruption-budget.yaml 
history | grep -i export
export KUBECONFIG=/etc/kubernetes/admin.conf
kubeadm version
yum list --showduplicates kubeadm --disableexcludes=kubernetes
kubectl get nodes
kubectl drain kube-master-flannel
kubectl get nodes
kubectl uncordon kube-master-flannel
kubectl get nodes
kubeadm upgrade plan
cat /etc/kubernetes/manifests/etcd.yaml 
ll
mkdir backup
cd backup/
ll
vi backup_etcd.yaml
ls -l /etc/kubernetes/pki/
ls -l /etc/kubernetes/pki/etcd/
vi backup_etcd.yaml
kubectl describe node kube-master-flannel
kubectl apply -f backup_etcd.yaml 
kubectl get jobs
kubectl describe job etcd-backup
kubectl get pods
kubectl describe job etcd-backup
cd /home/backup/
ll
ls -al
kubectl get pods
kubectl logs etcd-backup-szdqh
kubectl describe pod etcd-backup-szdqh
cd ~/backup/
cat backup_etcd.yaml 
cd /etc/kubernetes/pki/etcd
ll
kubectl delete job etcd-backup
kubectl get pods
kubectl get jobs
kubectl get pv
kubectl get pvc
cd ~/backup/backup_etcd.yaml 
cat ~/backup/backup_etcd.yaml 
vi ~/backup/backup_etcd.yaml 
cd ~/backup/backup_etcd.yaml 
cd ~/backup
kubectl apply -f backup_etcd.yaml 
kubectl get jobs
kubectl describe jobs etcd-backup
kubectl get jobs
kubectl get pods
kubectl delete job etcd-backup
kubectl get pods
kubectl get jobs
kubectl get serviceaccounts
kubectl describe serviceaccounts default
kubectl get serviceaccounts --all-namespaces
cd ../
cat busybox_deployment_livenessprobe.yaml 
cp busybox_deployment_livenessprobe.yaml busybox_security.yaml 
vi busybox_security.yaml 
kubectl apply -f busybox_security.yaml 
kubectl get deployments
kubectl get pods
kubectl get pods busybox-deployment-649f974747-2cpbt -o yaml
kubectl get sa
kubectl describe sa default
kubectl get secrets
mkdir secrets
kubectl delete deployment busybox-deployment
kubectl get pods
cp busybox_security.yaml secrets/
cd secrets/
ll
vi sa_whizauth.yaml
kubectl apply -f sa_whizauth.yaml 
kubectl get sa
kubectl describe sa whizauth
kubectl get secret
kubectl describe secret whizauth-token-tncfc
vi sa_whizauth.yaml 
kubectl delete sa whizauth
kubectl get secret
kubectl get sa
vi sa_whizauth.yaml 
kubectl apply -f sa_whizauth.yaml 
cat sa_whizauth.yaml 
vi sa_whizauth.yaml 
kubectl apply -f sa_whizauth.yaml 
vi secret_whizauth.yaml
kubectl apply -f secret_whizauth.yaml 
vi secret_whizauth.yaml
kubectl apply -f secret_whizauth.yaml 
kubectl get sa
kubectl describe sa whizauth
kubectl get secret
vi busybox_security.yaml 
kubectl get deployments
kubectl apply -f busybox_security.yaml 
kubectl get pods
kubectl get pods busybox-deployment-7f8695cf5f-n6g4c -o yaml
ps -aux | grep -i kube-apiserver
cd /etc/kubernetes/manifests/
ll
vi kube-apiserver.yaml 
kubectl get roles --all-namespaces
kubectl describe role kube-proxy
kubectl describe role kube-proxy -n kube-system
kubectl get clusterroles
kubectl describe cr view
kubectl describe clusterroles view
kubectl get clusterroles
kubectl describe clusterroles system:kube-dns
cd ~/secrets/
ll
vi clusterRole.yaml
kubectl apply -f clusterRole.yaml 
kubectl describe clusterrole pod-reader
vi cluster-admin-binding.yaml
kubectl apply -f cluster-admin-binding.yaml 
kubectl get sa
kubectl delete sa whizauth
kubectl get secret
kubectl describe sa admin1
kubectl describe secret admin1-token-p7tjm
kubectl delete sa admin1
kubectl get secret
kubectl get sa
ll
cp cluster-admin-binding.yaml cluster-admin-clusterrolebinding.yaml 
vi cluster-admin-clusterrolebinding.yaml 
exit
ll
cat busybox_security.yaml 
mkdir pod_security
cp busybox_security.yaml pod_security/
cd pod_security/
ll
vi busybox_security.yaml 
kubectl apply -f busybox_security.yaml 
history | grep -i export
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f busybox_security.yaml 
kubectl get pods
kubectl get deployments
kubectl delete deployment busybox-deployment
kubectl get deployments
kubectl get pods
kubectl exec -it busybox-nosc-86dbdc9d96-lqvkx sh
ll
cp busybox_security.yaml busybox_no_security.yaml 
kubectl delete deployment busybox-nosc
vi busybox_security.yaml 
kubectl get pods
kubectl apply -f busybox_security.yaml 
kubectl get pods
kubectl exec -it busybox-nosc-55bf4b768c-k54lr sh
kubectl delete deployment busybox-nosc
kubectl get pods
kubectl get deployments
ll
cp busybox_security.yaml busybox_security_container.yaml 
vi busybox_security_container.yaml 
kubectl apply -f busybox_security_container.yaml 
kubectl get pods
kubectl exec -it busybox-nosc-856dc5b665-5zn2t sh
kubectl delete -f busybox_security_container.yaml 
ll
kubectl get pods
kubectl get deployments
kubectl get psp
kubectl describe psp psp.flannel.unprivileged
kubectl get pods
kubectl get pods --all-namespaces | grep -i flannel
kubectl get pods kube-flannel-ds-amd64-k76zs -o yaml
kubectl get pods kube-flannel-ds-amd64-k76zs -o yaml -n kubec-system
kubectl get pods kube-flannel-ds-amd64-k76zs -o yaml -n kube-system
kubectl get pods kube-flannel-ds-amd64-k76zs -o yaml -n kube-system | grep -i account
kubectl get sa --all-namespaces
kubectl get sa --all-namespaces | grep -i flannel
kubectl get clusterrolebindings | grep -i flannel
kubectl get clusterrolebindings flannel -0 yaml
kubectl get clusterrolebindings flannel -o yaml
kubectl get pods --all-namespaces | grep -i flannel
kubectl get pods kube-flannel-ds-amd64-k76zs -o yaml -n kube-system | grep -i account
kubectl get sa --all-namespaces | grep -i flannel
kubectl get clusterrolebindings flannel -0 yaml
kubectl get deployments
kubectl get pods
cd ../
mkdir network_policies
cd network_policies/
ll
vi networkpolicy_DenyAll.yaml
kubectl apply -f networkpolicy_DenyAll.yaml 
kubectl get np
kubectl get networkpolicy
kubectl describe networkpolicy policy-denyall
kubectl delete -f networkpolicy_DenyAll.yaml 
kubectl get networkpolicy
cp networkpolicy_DenyAll.yaml networkpolicy_AllowAll.yaml 
vi networkpolicy_AllowAll.yaml 
kubetcl apply -f networkpolicy_AllowAll.yaml 
kubectl apply -f networkpolicy_AllowAll.yaml 
kubectl get networkpolicy
kubectl describe networkpolicy policy-allowall
kubectl delete -f networkpolicy_AllowAll.yaml 
cd ../
docker login --help
cd /root/.docker
pwd
ls a-l
ls -a
ls -a | grep -i .d*
 -name config.json
ll
mkdr secure_images
mkdir secure_images
cd secure_images/
ll
vi mongodb_secure_image_pull.yaml
cd ../
cd /etc/kubernetes/pki
ll
cd etcd
ll
cd /etc/kubernetes/
ll
cat admin.conf 
cat kubelet.conf 
ll
exit
