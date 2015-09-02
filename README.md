# example-of-famous-onupdate-bug
Though I never call requestUpdate() or requestUpdateOnNextTick() in any of my onUpdate callbacks ( in fact I only call requestUpdateOnNextTick() only once in my code in CurriculumMenu.slideMenuTo ), my onUpdate callback in CurriculumMenu is continuously being called.
