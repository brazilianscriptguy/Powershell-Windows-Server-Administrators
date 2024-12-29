Describe 'Test Get-UserInfo Function' {
    # Mocking the Get-UserInfo function to simulate behavior
    Mock -CommandName Get-UserInfo -MockWith {
        param([string]$UserName)
        if (-not $UserName -or $UserName -eq '') {
            throw "Invalid username provided"
        }
        [PSCustomObject]@{
            UserName = $UserName
            FullName = "$UserName Full"
            Email    = "$UserName@example.com"
            Title    = "Mocked Title"
        }
    }

    Context 'When valid parameters are passed' {
        It 'Should return user information' {
            $Result = Get-UserInfo -UserName 'ValidUser'
            $Result | Should -Not -BeNullOrEmpty
            $Result.UserName | Should -Be 'ValidUser'
            $Result.Email | Should -Be 'ValidUser@example.com'
        }
    }

    Context 'When invalid parameters are passed' {
        It 'Should throw an error' {
            { Get-UserInfo -UserName '' } | Should -Throw -ErrorMessage "Invalid username provided"
        }
    }
}
