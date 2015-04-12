
Describe "Git-Git" {
  Context "Standard-Output" {
    It 'should equal `git --version`' {
      $expected = git --version
      $actual = git git --version
      $actual | Should Be $expected
    }
    
    It 'should equal `git ls-files`' {
      $expected = git ls-files
      $actual = git git ls-files
      $actual | Should Be $expected
    }
    
    It 'should equal `git log -5`' {
      $expected = git log -5
      $actual = git git log -5
      $actual | Should Be $expected
    }
    
    It 'should equal `git status`' {
      $expected = git status
      $actual = git git status
      $actual | Should Be $expected
    }
  }
  
  Context "Nesting" {
    It 'should equal `git git status`' {
      $expected = git status
      $actual = git git status
      $actual | Should Be $expected
    }
    
    It 'should equal `git git git status`' {
      $expected = git status
      $actual = git git git status
      $actual | Should Be $expected
    }
    
    It 'should equal `git git git git status`' {
      $expected = git status
      $actual = git git git git status
      $actual | Should Be $expected
    }
  }
}