    Pod::Spec.new do |spec|
    spec.name         = 'LLToast'
    spec.version      = '0.0.1.3' 
    spec.summary      = '弹框toast组件'
    spec.homepage     = "https://github.com/SummitFH/FHSpecRepo.git"
    spec.license      = "MIT"
    spec.author       = { "Summit" => "xxxqq.com" }
    spec.social_media_url   = ""
    spec.source = {:git => 'git@github.com:SummitFH/FHSpecRepo.git', :tag => spec.version}
    
    spec.platform = :ios,'8.0'
    spec.ios.deployment_target = '8.0'
    
    spec.requires_arc = true

    spec.source_files = 'LLToast/LLToast/**/*.{h,m}'
    spec.exclude_files = 'LLToast/LLToast/info.plist'
    
    spec.pod_target_xcconfig = {
        'ENABLE_BITCODE' => 'NO',
    }

    spec.dependency 'MBProgressHUD', '~> 1.1.0'
end
