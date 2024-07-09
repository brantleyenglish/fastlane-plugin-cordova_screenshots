require 'xcodeproj'

module Fastlane
  module Actions
    class RetrofitCordovaScreenshotsAndroidAction < Action
      def self.run(params)
        UI.message("Retrofitting Android UI test from '#{CordovaScreenshots::CORDOVA_SCREENSHOTS_ANDROID_CONFIG_PATH}' into Cordova Android project.")

        package_name = Fastlane::Helper::CordovaScreenshotsHelper.read_package_name_from_android_test
        package_name_path = package_name.gsub('.', '/')

        Fastlane::Helper::CordovaScreenshotsHelper.copy_android_test(package_name_path)
        Fastlane::Helper::CordovaScreenshotsHelper.copy_android_manifest(package_name)

        UI.success("Done. Build your test app (TODO) and then run `fastlane screengrab` to take screenshots.")
      end

      def self.description
        'Retrofit test into Android project'
      end

      def self.authors
        ['Jan Piotrowski']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ''
      end

      def self.available_options
        [
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        [:android].include?(platform)
      end
    end
  end
end
