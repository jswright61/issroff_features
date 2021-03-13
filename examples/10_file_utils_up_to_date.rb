class Example
  YESTERDAY_FILES = %w[some_older_file.rb filepaths.rb hello.c hello.h]
  TODAY_FILES = %w[new_file hello.o example.rb]

  def initialize
    now = Time.now
    yesterday = now - (3600 * 24)
    FileUtils.touch(YESTERDAY_FILES, mtime: yesterday)
    FileUtils.touch(TODAY_FILES, mtime: now )
  end

  def cleanup
    FileUtils.rm(YESTERDAY_FILES + TODAY_FILES, force: true)
  end

  def tweet_body
    <<~TWEET_BODY
      10/ One third! FileUtils#uptodate? tells us if a file is newer than all files
      in a list of files. Seems to me that it'd be most useful for checking if files
      have been compiled. I can also see use cases for checking if data has been
      updated in data pipelines
    TWEET_BODY
  end

  def name
    "FileUtils#uptodate?"
  end

  def example_01
    # FileUtils#up_to_Date takes two arguments: a String file path to the new file,
    # and a list of String filepaths of old files to check against
    # It returns whether the new file is actually newer than all old files
    FileUtils.uptodate?("new_file", ["some_older_file.rb", "filepaths.rb"])
    # => true
  end


  def example_02
    # In this example (from the Ruby docs), we check if the
    # object file (hello.o) has been compiled since we most recently wrote to
    # the header file (hello.h) and c file (heilo.c)
    FileUtils.uptodate?("hello.o", %w[hello.c hello.h])
    # => true
  end

  def example_03
    # Lastly, all non-existent files are older than any other file
    FileUtils.uptodate?("example.rb", ["file/does/not/exist.rb"])
    #=> true
  end
end