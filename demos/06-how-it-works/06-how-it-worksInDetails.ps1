$string = 'some string: "{{placeholder}}", and: "{{placeholder}}", and more: "{{placeholder}}"'
$pattern = '(?''pre''[^{}]{1})?(?''placeholder''{{(?''executionFlag''&)?(?''value''[^{}]*)}})(?''post''[^{}]{1})?'

#matchEvaluator class definition
class matchEvaluator
{
    $count = 0
    [string]DoSomething([System.Text.RegularExpressions.Match]$match)
    {
        $result = Get-Random -Minimum 5 -Maximum 15
        return $result
    }
    [string]Increment([System.Text.RegularExpressions.Match]$match)
    {
        $result = $this.count++
        return $result
    }
}

#matchEvaluator instance
$matchEvaluator = [matchEvaluator]::New()

#matchEvaluator delegate
$matchEvaluatorDelegate = [System.Delegate]::CreateDelegate([System.Text.RegularExpressions.MatchEvaluator], $matchEvaluator, 'Increment')

#hey regex, please replace all matches of the pattern in the string with the result of the matchEvaluator instance 'DoSomething' method every time you find a match.
[regex]::Replace($string, $pattern, $matchEvaluatorDelegate)
