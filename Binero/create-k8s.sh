openstack coe cluster create k8s-2 \
                      --cluster-template k8s-template_2 \
                      --master-count 2 \
                      --node-count 2 \
                      --labels metrics_server_enabled=0,ingress_controller="traefik",master_lb_floating_ip_enabled=1,auto_healing_enabled=1,auto_scaling_enabled=1,min_node_count=2,max_node_count=5

