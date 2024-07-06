from django.shortcuts import render, redirect


def render_home(request):
    print("tomate")
    # return render(request, 'home.html')
    return redirect('/tasks/')
