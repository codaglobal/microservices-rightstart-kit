# Microservices Rightstart Kit
Microservices simplified with Kubernetes + Consul +Ambassador + Spring + Python + Go + Terraform. Get started with your microservices infrastructure with just one command using the Microservices Rightstart Kit (MRK).

### Folder Structure 
```
├── LICENSE
├── README.md
├── apps
│   ├── go-service
│   ├── python-service
│   └── spring-service
├── assets
│   └── MRK\ Architecture.png
├── helm-charts
│   ├── ambassador-consul-resolver
│   ├── consul-helm-master                  # This is a copy from consul git master, since helm stable charts is not the latest with consul connect feature.
│   ├── go-service
│   ├── python-service
│   └── spring-service
└── terraform
    ├── ambassador.tf
    ├── apps.tf
    ├── consul.tf
    ├── creds
    ├── gkecluster.tf
    ├── provider.tf
    └── tiller.tf
```

### [Detailed information on how to setup this project and use it as a base for your microservices application is eleborated as a article. Click Here!] ()