RubyMotion Hybrid Sample
========================

This sample demonstrates how to build a RubyMotion app that runs on both iOS and Android.

This is a simple app, implemented in pure-Ruby as below:

```
class MainScreen < Screen
  def on_load
    @label = Label.make('Tap to start')
    @button = Button.make('Start', 'Stop') { timer_tap }

    self << @label
    self << @button
  end

  def timer_tap
    if @timer
      @timer.invalidate
      @timer = nil
    else
      @duration = 0
      @timer = Timer.make(0.1) do
        @label.text = "%.1f" % (@duration += 0.1)
      end
    end
  end
end
```

The app uses a portable DSL implemented just for this sample (see the ```app/ios``` and ```app/android``` directories for platform-specific code).

Usage
-----

```
$ rake ios:simulator      # run in the iOS simulator
$ rake ios:device         # run in the iOS device
$ rake android:emulator   # run in the Android emulator (not recommended)
$ rake android:device     # run in the Android device 
```

License
-------

```
Copyright (c) 2012 HipByte SPRL and Contributors

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the “Software”), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
```
