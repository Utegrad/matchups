from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def brackets(request):
    return render(
        request, 'brackets/bracket.html', {
            'message': 'A Manual Bracket Table',
            'theme': 'spacelab',
        }
    )

