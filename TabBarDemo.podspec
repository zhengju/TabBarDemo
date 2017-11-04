Pod::Spec.new do |s|
    s.name         = 'TabBarDemo'
    s.version      = '1.0.0'
    s.summary      = 'An easy way to use TabBarController'
    s.homepage     = 'https://github.com/zhengju/TabBarDemo'
    s.license      = 'MIT'
    s.authors      = {'ZJ Zheng' => '2824816064@qq.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/zhengju/TabBarDemo.git', :tag => s.version}
    s.source_files = 'TabBar_Demo/**/*.{h,m}'
    
    s.requires_arc = true
end
