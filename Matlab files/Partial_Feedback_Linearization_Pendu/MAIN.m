% Run each section separately for Partial Feedback Linearization Controller of Pendubot
% Collocated and Non-Collocated Case

%% Non-Collocated Case

InitModel4Pendu
lqr_pendu

sim('pendu_partial_feed_noncolocated')

plots

%% Collocated-Case

InitModel4Pendu_coloc
lqr_pendu

sim('pendu_partial_feed_colocated')

plots